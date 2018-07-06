# -*- coding: utf-8 -*-
# == Schema Information ==
#
# BASIC認証とユーザーテーブルテーブル (type020_users as Type020User)
#
# |------------+----------------+----------+-------------+------+-------|
# | カラム名   | 意味           | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------------+----------+-------------+------+-------|
# | id         | ID             | integer  | NOT NULL PK |      |       |
# | email      | メールアドレス | string   | NOT NULL    |      | A!    |
# | password   | パスワード     | string   | NOT NULL    |      |       |
# | created_at | 作成日時       | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時       | datetime | NOT NULL    |      |       |
# |------------+----------------+----------+-------------+------+-------|

class CreateType020Users < ActiveRecord::Migration[5.1]
  def up
    create_table :type020_users, force: true do |t|
      t.string :email,    null: false
      t.string :password, null: false
      t.timestamps        null: false
      t.index :email, unique: true
    end
  end
end
