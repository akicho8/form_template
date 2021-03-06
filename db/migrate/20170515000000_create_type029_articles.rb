# -*- coding: utf-8 -*-
# == Schema Information ==
#
# AJAX例(partial更新。スライダー)テーブル (type029_articles as Type029Article)
#
# |--------------+--------------+----------+-------------+------+-------|
# | カラム名     | 意味         | タイプ   | 属性        | 参照 | INDEX |
# |--------------+--------------+----------+-------------+------+-------|
# | id           | ID           | integer  | NOT NULL PK |      |       |
# | show_counter | Show counter | integer  |             |      |       |
# | created_at   | 作成日時     | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時     | datetime | NOT NULL    |      |       |
# |--------------+--------------+----------+-------------+------+-------|

class CreateType029Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type029_articles, force: true do |t|
      t.integer :show_counter
      t.timestamps null: false
    end
  end
end
