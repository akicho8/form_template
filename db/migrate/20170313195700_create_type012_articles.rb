# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 孫まで一気に更新テーブル (type012_articles as Type012Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | comment0   | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class CreateType012Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type012_articles, force: true do |t|
      t.string :comment0
      t.timestamps null: false
    end

    create_table :type012_s1_articles, force: true do |t|
      t.belongs_to :type012_article, null: false, index: true
      t.string :comment1
      t.timestamps null: false
    end

    create_table :type012_s2_articles, force: true do |t|
      t.belongs_to :type012_s1_article, null: false, index: true
      t.string :comment2
      t.timestamps null: false
    end
  end
end
