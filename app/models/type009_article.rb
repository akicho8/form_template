# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード1テーブル (type009_articles as Type009Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class Type009Article < ApplicationRecord
  has_many :type009_attachments, inverse_of: :type009_article, dependent: :destroy
  accepts_nested_attributes_for :type009_attachments

  with_options(presence: true) do
    validates :title
  end

  def type009_attachment_files=(v)
    assign_attributes(type009_attachments_attributes: v.collect { |e| {media_file: e} })
  end
end
