# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 中間情報が単なる連携ではなく別の情報を持つ場合テーブル (type096_articles as Type096Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

module NameSpace1
  class Type096ArticlesController < ApplicationController
    include ModulableCrud::All
  end
end
