# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイル1つの情報テーブル (type009_attachments as Type009Attachment)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type009_article_id | Type009 article | integer  |             | => Type009Article#id | A     |
# | media_file         | ファイル        | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type009Attachment モデルは Type009Article モデルから has_many :type009_attachments されています。
#--------------------------------------------------------------------------------

class Type009Attachment < ApplicationRecord
  mount_uploader :media_file, AttachmentUploader

  belongs_to :type009_article, inverse_of: :type009_attachments
end
