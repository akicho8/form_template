# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報テーブル (type008_team_ships as Type008TeamShip)
#
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type008_article_id | Type008 article | integer  | NOT NULL    | => Type008Article#id | B     |
# | team_id            | Team            | integer  | NOT NULL    | => Team#id           | A     |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type008TeamShip モデルは Type008Article モデルから has_many :type008_team_ships されています。
# ・Type008TeamShip モデルは Team モデルから has_many :type006_team_ships されています。
#--------------------------------------------------------------------------------

class Type008TeamShip < ApplicationRecord
  belongs_to :type008_article
  belongs_to :team
end
