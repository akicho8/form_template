# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイルアップロードテーブル (type004_articles as Type004Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | pixer      | ファイル | string   |             |      |       |
# | comment    | コメント | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type004Article < ApplicationRecord
  mount_uploader :pixer, AttachmentUploader

  with_options(:presence => true) do
    validates :comment
  end
end
