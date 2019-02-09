# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード1テーブル (type037_articles as Type037Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class Type037Article < ApplicationRecord
  has_many :type037_attachments, inverse_of: :type037_article, dependent: :destroy
  accepts_nested_attributes_for :type037_attachments

  with_options(presence: true) do
    validates :title
  end

  def type037_attachment_files=(v)
    assign_attributes(type037_attachments_attributes: v.collect { |e| {media_file: e} })
  end
end
