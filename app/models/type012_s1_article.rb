# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 子テーブル (type012_s1_articles as Type012S1Article)
#
# +--------------------+----------+----------+-------------+----------------------+-------+
# | カラム名           | 意味     | タイプ   | 属性        | 参照                 | INDEX |
# +--------------------+----------+----------+-------------+----------------------+-------+
# | id                 | ID       | integer  | NOT NULL PK |                      |       |
# | type012_article_id | 親       | integer  | NOT NULL    | => Type012Article#id | A     |
# | comment1           | コメント | string   |             |                      |       |
# | created_at         | 作成日時 | datetime | NOT NULL    |                      |       |
# | updated_at         | 更新日時 | datetime | NOT NULL    |                      |       |
# +--------------------+----------+----------+-------------+----------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type012S1Article モデルは Type012Article モデルから has_many :type012_s1_articles されています。
#--------------------------------------------------------------------------------

class Type012S1Article < ApplicationRecord
  belongs_to :type012_article, inverse_of: :type012_s1_articles

  has_many :type012_s2_articles, -> { order(:created_at) }, inverse_of: :type012_s1_article, dependent: :destroy
  accepts_nested_attributes_for :type012_s2_articles, reject_if: proc { |attributes| attributes[:comment2].blank? }, allow_destroy: true
end
