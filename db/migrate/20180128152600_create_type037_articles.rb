# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 複数ファイルアップロード1テーブル (type037_articles as Type037Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class CreateType037Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type037_articles, force: true do |t|
      t.string :title
      t.timestamps null: false
    end
    create_table :type037_attachments, force: true do |t|
      t.belongs_to :type037_article
      t.string :media_file
      t.timestamps null: false
    end
  end
end
