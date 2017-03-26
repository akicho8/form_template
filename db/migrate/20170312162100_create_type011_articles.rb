# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 2ch形式スレッドテーブル (type011_articles as Type011Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType011Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type011_articles, force: true do |t|
      t.string :title
      t.timestamps null: false
    end

    create_table :type011_comments, force: true do |t|
      t.belongs_to :type011_article, null: false, index: true
      t.string :comment
      t.timestamps null: false
    end
  end
end
