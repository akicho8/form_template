# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定2テーブル (type007_articles as Type007Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType007Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type007_articles, :force => true do |t|
      t.string :name
      t.timestamps :null => false
    end
    create_table :type007_seven_ships, :force => true do |t|
      t.belongs_to :type007_article, :null => false
      t.belongs_to :seven_day, :null => false
      t.timestamps :null => false
    end
  end
end
