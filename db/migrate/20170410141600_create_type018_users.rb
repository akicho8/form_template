# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 住所からGoogleマップ表示テーブル (type018_email_activations as Type018EmailActivation)
#
# +--------------+----------+----------+-------------+------+-------+
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +--------------+----------+----------+-------------+------+-------+
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | email  | 住所     | string   |             |      |       |
# | geocode_hash | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# +--------------+----------+----------+-------------+------+-------+

class CreateType018Users < ActiveRecord::Migration[5.1]
  def up
    create_table :type018_email_activations, :force => true do |t|
      t.string :email,          :null => false
      t.string :activate_token, :null => false
      t.datetime :expired_at,   :null => false
      t.datetime :activated_at
      t.timestamps              :null => false
      t.index :activate_token, :unique => true
    end

    create_table :type018_users, :force => true do |t|
      t.belongs_to :type018_email_activation
      t.string :handle_name,     :null => false
      t.string :email,           :null => false
      t.string :salt,            :null => false
      t.string :hashed_password, :null => false
      t.timestamps               :null => false
      t.index :email, :unique => true
    end
  end
end
