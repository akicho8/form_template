# -*- coding: utf-8 -*-
# == Schema Information ==
#
# プルダウンのマルチセレクトで複数項目設定テーブル (type008_articles as Type008Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType008Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type008_articles, force: true do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :type008_team_ships, force: true do |t|
      t.belongs_to :type008_article, null: false
      t.belongs_to :team, null: false
      t.timestamps null: false
    end
  end
end
