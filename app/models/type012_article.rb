# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 孫まで一気に更新できるよテーブル (type012_articles as Type012Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | comment0   | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class Type012Article < ApplicationRecord
  has_many :type012_s1_articles, -> { order(:created_at) }, inverse_of: :type012_article, dependent: :destroy
  accepts_nested_attributes_for :type012_s1_articles, reject_if: proc { |attributes| attributes[:comment1].blank? }, allow_destroy: true
end
