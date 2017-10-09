# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定1テーブル (type096_articles as Type096Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

module NameSpace1
  class Type096ArticlesController < ApplicationController
    include PluggableCrud::All
  end
end
