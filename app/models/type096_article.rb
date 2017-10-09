# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定1テーブル (type096_articles as Type096Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type096Article < ApplicationRecord
  has_many :type096_team_ships, dependent: :destroy # inverse_of: :type096_article は不要だった
  accepts_nested_attributes_for :type096_team_ships # フォームでまとめて設定するため
  has_many :teams, through: :type096_team_ships     # 中間情報の legal_accept_key を含めて重要なためこれはあまり使う意味がない

  with_options(presence: true) do
    validates :name
  end
end
