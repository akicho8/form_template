# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type016_team_ships as Type016TeamShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type016_article_id | Type016 article | integer  | NOT NULL    | => Type016Article#id | B     |
# | team_id            | Team            | integer  | NOT NULL    | => Team#id           | A     |
# | relation_key       | Relation key    | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type016TeamShip モデルは Type016Article モデルから has_many :v1_type016_team_ships されています。
# ・Type016TeamShip モデルは Team モデルから has_many :type006_team_ships されています。
#--------------------------------------------------------------------------------

class Type016TeamShip < ApplicationRecord
  belongs_to :type016_article
  belongs_to :team
end
