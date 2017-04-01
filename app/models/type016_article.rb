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
  # has_many と has_one で中間レコードが衝突するのを避けるために relation_key で分けている
  # 二つなければ where は不要
  
  concerning :ManyMethods do
    included do
      has_many :v1_type016_seven_ships, -> { where(:relation_key => "many") }, :dependent => :destroy, :class_name => "Type016SevenShip", :inverse_of => :type016_article
      has_many :v1_seven_days, :through => :v1_type016_seven_ships, :source => :seven_day
      accepts_nested_attributes_for :v1_type016_seven_ships
    end
  end

  concerning :OneMethods do
    included do
      has_one :v2_type016_seven_ship, -> { where(:relation_key => "one") }, :dependent => :destroy, :class_name => "Type016SevenShip", :inverse_of => :type016_article
      accepts_nested_attributes_for :v2_type016_seven_ship
    end

    # 新規でも form.fields_for(:v2_type016_seven_ship) do |form| のまま書けるようにするため。
    # form.fields_for(:v2_type016_seven_ship, form.object.v2_type016_seven_ship || form.object.build_v2_type016_seven_ship) do |form|
    def v2_type016_seven_ship
      super || build_v2_type016_seven_ship
    end
  end

  with_options(:presence => true) do
    validates :name
  end
end
