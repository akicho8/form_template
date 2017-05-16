# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイル1つの情報テーブル (type010_files as Type010File)
#
# +--------------------+----------------+----------+-------------+----------------------+-------+
# | カラム名           | 意味           | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+----------------+----------+-------------+----------------------+-------+
# | id                 | ID             | integer  | NOT NULL PK |                      |       |
# | type010_article_id | 画像セット情報 | integer  | NOT NULL    | => Type010Article#id | B     |
# | name               | Name           | string   |             |                      |       |
# | media_file         | ファイル       | string   | NOT NULL    |                      |       |
# | position           | 順序           | integer  | NOT NULL    |                      | A     |
# | created_at         | 作成日時       | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時       | datetime | NOT NULL    |                      |       |
# +--------------------+----------------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type010File モデルは Type010Article モデルから has_one :type010_file_a されています。
#--------------------------------------------------------------------------------

class Type010File < ApplicationRecord
  mount_uploader :media_file, AttachmentUploader

  belongs_to :type010_article, inverse_of: :type010_files

  attr_accessor :kesuyo

  # after_save do
  #   raise kesuyo.inspect
  #   if kesuyo.to_s == "1"
  #     destroy!
  #   end
  # end
end
