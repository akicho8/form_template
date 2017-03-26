# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type008_seven_ships as Type008SevenShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type008_article_id | Type008 article | integer  | NOT NULL    | => Type008Article#id | B     |
# | seven_day_id       | Seven day       | integer  | NOT NULL    | => SevenDay#id       | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type008SevenShip モデルは Type008Article モデルから has_many :type008_seven_ships されています。
# ・Type008SevenShip モデルは SevenDay モデルから has_many :type006_seven_ships されています。
#--------------------------------------------------------------------------------

class Type008SevenShip < ApplicationRecord
  belongs_to :type008_article
  belongs_to :seven_day
end
