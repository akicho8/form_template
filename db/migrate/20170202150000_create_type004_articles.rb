# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ファイルアップロードテーブル (type004_articles as Type004Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | media_file | ファイル | string   |             |      |       |
# | comment    | コメント | string   |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

class CreateType004Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type004_articles, force: true do |t|
      t.string :media_file
      t.string :comment
      t.timestamps null: false
    end
  end
end
