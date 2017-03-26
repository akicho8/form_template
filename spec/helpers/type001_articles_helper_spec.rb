# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type001_articles as Type001Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | subject    | 件名     | string   |             |      |       |
# | body       | 内容     | text     |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Type001ArticlesHelper. For example:
#
# describe Type001ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Type001ArticlesHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
