# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type035_articles as Type035Article)
#
# |----------+------+---------+-------------+------+-------|
# | カラム名 | 意味 | タイプ  | 属性        | 参照 | INDEX |
# |----------+------+---------+-------------+------+-------|
# | id       | ID   | integer | NOT NULL PK |      |       |
# | position | 順序 | integer |             |      |       |
# |----------+------+---------+-------------+------+-------|

class CreateType035Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type035_articles, force: true do |t|
      t.integer :position
    end
  end
end
