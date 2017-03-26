# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type007_seven_ships as Type007SevenShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type007_article_id | Type007 article | integer  | NOT NULL    | => Type007Article#id | B     |
# | seven_day_id       | Seven day       | integer  | NOT NULL    | => SevenDay#id       | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type007SevenShip モデルは Type007Article モデルから has_many :type007_seven_ships されています。
# ・Type007SevenShip モデルは SevenDay モデルから has_many :type006_seven_ships されています。
#--------------------------------------------------------------------------------

class Type007SevenShip < ApplicationRecord
  belongs_to :type007_article
  belongs_to :seven_day
end
