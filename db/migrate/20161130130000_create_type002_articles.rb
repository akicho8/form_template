# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文の画像認証対応版テーブル (type002_articles as Type002Article)
#
# +------------+-----------+----------+-------------+------+-------+
# | カラム名   | 意味      | タイプ   | 属性        | 参照 | INDEX |
# +------------+-----------+----------+-------------+------+-------+
# | id         | ID        | integer  | NOT NULL PK |      |       |
# | subject    | 件名      | string   |             |      |       |
# | body       | 内容      | text     |             |      |       |
# | remote_ip  | Remote ip | string   |             |      |       |
# | created_at | 作成日時  | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時  | datetime | NOT NULL    |      |       |
# +------------+-----------+----------+-------------+------+-------+

class CreateType002Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type002_articles, :force => true do |t|
      t.string :subject
      t.text :body
      t.string :remote_ip
      t.timestamps :null => false
    end
  end
end
