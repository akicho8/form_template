# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 同じモデルに対してチェックボックスとラジオボタンテーブル (type016_articles as Type016Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType016Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type016_articles, :force => true do |t|
      t.string :name
      t.timestamps :null => false
    end
    create_table :seven_days, :force => true do |t|
      t.string :name, :null => false
      t.timestamps :null => false
    end
    create_table :type016_seven_ships, :force => true do |t|
      t.belongs_to :type016_article, :null => false
      t.belongs_to :seven_day, :null => false
      t.string :relation_key
      t.timestamps :null => false
    end
  end
end
