# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイル1つの情報テーブル (type037_attachments as Type037Attachment)
#
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type037_article_id | Type037 article | integer  |             | => Type037Article#id | A     |
# | media_file         | ファイル        | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# |--------------------+-----------------+----------+-------------+----------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type037Attachment モデルは Type037Article モデルから has_many :type037_attachments されています。
#--------------------------------------------------------------------------------

class Type037Attachment < ApplicationRecord
  mount_uploader :media_file, AttachmentUploader

  belongs_to :type037_article, inverse_of: :type037_attachments

  def media_info
    {
      url: media_file.url,
      content_type: media_file.content_type,
      filename: Pathname(media_file.url).basename.to_s,
    }
  end
end
