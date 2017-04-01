# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type016_seven_ships as Type016SevenShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type016_article_id | Type016 article | integer  | NOT NULL    | => Type016Article#id | B     |
# | seven_day_id       | Seven day       | integer  | NOT NULL    | => SevenDay#id       | A     |
# | relation_key       | Relation key    | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type016SevenShip モデルは Type016Article モデルから has_many :v1_type016_seven_ships されています。
# ・Type016SevenShip モデルは SevenDay モデルから has_many :type006_seven_ships されています。
#--------------------------------------------------------------------------------

class Type016SevenShip < ApplicationRecord
  belongs_to :type016_article
  belongs_to :seven_day
end
