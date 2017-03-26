# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 孫テーブル (type012_s2_articles as Type012S2Article)
#
# +-----------------------+----------+----------+-------------+------------------------+-------+
# | カラム名              | 意味     | タイプ   | 属性        | 参照                   | INDEX |
# +-----------------------+----------+----------+-------------+------------------------+-------+
# | id                    | ID       | integer  | NOT NULL PK |                        |       |
# | type012_s1_article_id | 親       | integer  | NOT NULL    | => Type012S1Article#id | A     |
# | comment2              | コメント | string   |             |                        |       |
# | created_at            | 作成日時 | datetime | NOT NULL    |                        |       |
# | updated_at            | 更新日時 | datetime | NOT NULL    |                        |       |
# +-----------------------+----------+----------+-------------+------------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type012S2Article モデルは Type012S1Article モデルから has_many :type012_s2_articles されています。
#--------------------------------------------------------------------------------

class Type012S2Article < ApplicationRecord
  belongs_to :type012_s1_article, :inverse_of => :type012_s2_articles
end
