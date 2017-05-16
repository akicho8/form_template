# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 確認付き複数ファイルアップロードテーブル (type005_articles as Type005Article)
#
# +------------+----------+----------+-------------+------+-------+
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------+----------+-------------+------+-------+
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | title      | タイトル | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# +------------+----------+----------+-------------+------+-------+

class CreateType005Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type005_articles, force: true do |t|
      t.string :title
      t.timestamps null: false
    end
    create_table :type005_files, force: true do |t|
      t.belongs_to :type005_article
      t.string :media_file
      t.timestamps null: false
    end
  end
end
