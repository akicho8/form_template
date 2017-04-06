# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 住所からGoogleマップ表示テーブル (type017_articles as Type017Article)
#
# +--------------+----------+----------+-------------+------+-------+
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +--------------+----------+----------+-------------+------+-------+
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | map_address  | 住所     | string   |             |      |       |
# | geocode_hash | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# +--------------+----------+----------+-------------+------+-------+

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Type017ArticlesHelper. For example:
#
# describe Type017ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Type017ArticlesHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
