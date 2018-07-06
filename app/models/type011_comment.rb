# -*- coding: utf-8 -*-
# == Schema Information ==
#
# コメントテーブル (type011_comments as Type011Comment)
#
# |--------------------+--------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味         | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+--------------+----------+-------------+----------------------+-------|
# | id                 | ID           | integer  | NOT NULL PK |                      |       |
# | type011_article_id | 所属スレッド | integer  | NOT NULL    | => Type011Article#id | A     |
# | comment            | コメント     | string   |             |                      |       |
# | created_at         | 作成日時     | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時     | datetime | NOT NULL    |                      |       |
# |--------------------+--------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type011Comment モデルは Type011Article モデルから has_one :type011_comment_first されています。
#--------------------------------------------------------------------------------

class Type011Comment < ApplicationRecord
  belongs_to :type011_article, inverse_of: :type011_comments
end
