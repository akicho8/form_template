# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type007_team_ships as Type007TeamShip)
#
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type007_article_id | Type007 article | integer  | NOT NULL    | => Type007Article#id | B     |
# | team_id            | Team            | integer  | NOT NULL    | => Team#id           | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type007TeamShip モデルは Type007Article モデルから has_many :type007_team_ships されています。
# ・Type007TeamShip モデルは Team モデルから has_many :type006_team_ships されています。
#--------------------------------------------------------------------------------

class Type007TeamShip < ApplicationRecord
  belongs_to :type007_article
  belongs_to :team
end
