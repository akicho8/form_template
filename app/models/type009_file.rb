# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイル1つの情報テーブル (type009_files as Type009File)
#
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味            | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
# | id                 | ID              | integer  | NOT NULL PK |                      |       |
# | type009_article_id | Type009 article | integer  |             | => Type009Article#id | A     |
# | pixer              | ファイル        | string   |             |                      |       |
# | created_at         | 作成日時        | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時        | datetime | NOT NULL    |                      |       |
# +--------------------+-----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type009File モデルは Type009Article モデルから has_many :type009_files されています。
#--------------------------------------------------------------------------------

class Type009File < ApplicationRecord
  mount_uploader :pixer, AttachmentUploader

  belongs_to :type009_article, :inverse_of => :type009_files
end
