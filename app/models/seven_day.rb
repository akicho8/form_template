# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 曜日テーブル (seven_days as SevenDay)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | Name     | string   | NOT NULL    |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class SevenDay < ApplicationRecord
  has_many :type006_seven_ships, :dependent => :destroy
  has_many :type005_articles, :through => :type006_seven_ships

  default_scope { order(:id) }
end
