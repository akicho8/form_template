# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 位置が重要なアルバム情報テーブル (type010_articles as Type010Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | name       | 名前     | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType010Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type010_articles, force: true do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :type010_files, force: true do |t|
      t.belongs_to :type010_article, null: false, index: true
      t.string :name
      t.string :media_file, null: false
      t.integer :position, null: false
      t.timestamps null: false

      t.index :position
    end
  end
end
