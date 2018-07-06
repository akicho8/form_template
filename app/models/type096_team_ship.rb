# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type096_team_ships as Type096TeamShip)
#
# |--------------------+------------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味             | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+------------------+----------+-------------+----------------------+-------|
# | id                 | ID               | integer  | NOT NULL PK |                      |       |
# | type096_article_id | Type096 article  | integer  | NOT NULL    | => Type096Article#id | B     |
# | team_id            | Team             | integer  | NOT NULL    | => Team#id           | A     |
# | legal_accept_key   | Legal accept key | string   |             |                      |       |
# | created_at         | 作成日時         | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時         | datetime | NOT NULL    |                      |       |
# |--------------------+------------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type096TeamShip モデルは Type096Article モデルから has_many :type096_team_ships されています。
# ・Type096TeamShip モデルは Team モデルから has_many :type006_team_ships されています。
#--------------------------------------------------------------------------------

class Type096TeamShip < ApplicationRecord
  belongs_to :type096_article
  belongs_to :team
end
