# -*- coding: utf-8 -*-
# == Schema Information ==
#
# チェックボックスで複数項目設定1テーブル (type006_articles as Type006Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class CreateType006Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type006_articles, force: true do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :teams, force: true do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    create_table :type006_team_ships, force: true do |t|
      t.belongs_to :type006_article, null: false
      t.belongs_to :team, null: false
      t.timestamps null: false
    end
  end
end
