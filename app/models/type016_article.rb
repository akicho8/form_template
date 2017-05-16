# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 同じモデルに対してチェックボックスとラジオボタンテーブル (type016_articles as Type016Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type016Article < ApplicationRecord
  # has_many と has_one で中間レコードが衝突するのを避けるために relation_key で分けている。複数なければ relation_key は不要

  concerning :CheckboxMethods do
    included do
      has_many :v1_type016_team_ships, -> { where(relation_key: "v1_type016_team_ships") }, dependent: :destroy, class_name: "Type016TeamShip", inverse_of: :type016_article
      has_many :v1_teams, through: :v1_type016_team_ships, source: :team
      accepts_nested_attributes_for :v1_type016_team_ships
    end
  end

  concerning :RadioMethods do
    included do
      has_one :v2_type016_team_ship, -> { where(relation_key: "v2_type016_team_ship") }, dependent: :destroy, class_name: "Type016TeamShip", inverse_of: :type016_article
      accepts_nested_attributes_for :v2_type016_team_ship, reject_if: proc { |attributes| attributes[:team_id].blank? } # 「何も指定しない」を許可できるように reject_if が必要
    end

    # 必須かつ新規でも form.fields_for(:v2_type016_team_ship) do |form| のまま書けるようにするには次のコードを入れる
    #
    # def v2_type016_team_ship
    #   super || build_v2_type016_team_ship
    # end
    #
    # 必須ではに場合はオーバーライドせずビュー側で次のように書く
    # form.fields_for(:v2_type016_team_ship, form.object.v2_type016_team_ship || form.object.build_v2_type016_team_ship) do |form|
  end

  concerning :MultipleSelectMethods do
    included do
      has_many :v3_type016_team_ships, -> { where(relation_key: "v3_type016_team_ships") }, dependent: :destroy, class_name: "Type016TeamShip", inverse_of: :type016_article
      has_many :v3_teams, through: :v3_type016_team_ships, source: :team
      accepts_nested_attributes_for :v3_type016_team_ships
    end
  end

  concerning :SingleSelectMethods do
    included do
      has_many :v4_type016_team_ships, -> { where(relation_key: "v4_type016_team_ships") }, dependent: :destroy, class_name: "Type016TeamShip", inverse_of: :type016_article
      has_many :v4_teams, through: :v4_type016_team_ships, source: :team
      accepts_nested_attributes_for :v4_type016_team_ships
    end
  end

  with_options(presence: true) do
    validates :name
  end
end
