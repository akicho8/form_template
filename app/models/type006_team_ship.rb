# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type006_team_ships as Type006TeamShip)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type006_article_id | Type006 article | integer  | NOT NULL    | => Type006Article#id | B     |
# | team_id            | Team            | integer  | NOT NULL    | => Team#id           | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type006TeamShip モデルは Type006Article モデルから has_many :type006_team_ships されています。
# ・Type006TeamShip モデルは Team モデルから has_many :type006_team_ships されています。
#--------------------------------------------------------------------------------

class Type006TeamShip < ApplicationRecord
  belongs_to :type006_article
  belongs_to :team
end
