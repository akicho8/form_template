# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type006_seven_ships as Type006SevenShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type006_article_id | Type006 article | integer  | NOT NULL    | => Type006Article#id | B     |
# | seven_day_id       | Seven day       | integer  | NOT NULL    | => SevenDay#id       | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type006SevenShip モデルは Type006Article モデルから has_many :type006_seven_ships されています。
# ・Type006SevenShip モデルは SevenDay モデルから has_many :type006_seven_ships されています。
#--------------------------------------------------------------------------------

class Type006SevenShip < ApplicationRecord
  belongs_to :type006_article
  belongs_to :seven_day
end
