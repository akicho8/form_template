# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証可能ユーザーテーブル (type018_users as Type018User)
#
# +-----------------------------+--------------------------+----------+-------------+------------------------------+-------+
# | カラム名                    | 意味                     | タイプ   | 属性        | 参照                         | INDEX |
# +-----------------------------+--------------------------+----------+-------------+------------------------------+-------+
# | id                          | ID                       | integer  | NOT NULL PK |                              |       |
# | type018_email_activation_id | Type018 email activation | integer  |             | => Type018EmailActivation#id | B     |
# | handle_name                 | 名前                     | string   | NOT NULL    |                              |       |
# | email                       | メールアドレス           | string   | NOT NULL    |                              | A!    |
# | salt                        | 塩                       | string   | NOT NULL    |                              |       |
# | salted_password             | ハッシュ化パスワード     | string   | NOT NULL    |                              |       |
# | created_at                  | 作成日時                 | datetime | NOT NULL    |                              |       |
# | updated_at                  | 更新日時                 | datetime | NOT NULL    |                              |       |
# +-----------------------------+--------------------------+----------+-------------+------------------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type018User モデルは Type018EmailActivation モデルから has_many :type018_users されています。
#--------------------------------------------------------------------------------

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
      t.string :salted_password, :null => false
      t.timestamps               :null => false
      t.index :email, :unique => true
    end

    create_table :type018_password_reset_url_notifications, :force => true do |t|
      t.belongs_to :type018_user, :null => false, :index => false # FIXME: index は有効にすること
      t.string :email, :null => false
      t.string :notice_token, :null => false
      t.datetime :expired_at,   :null => false
      t.datetime :used_at
      t.timestamps              :null => false
      # t.index :notice_token, :unique => true
    end

    create_table :type018_password_reseters, :force => true do |t|
      t.belongs_to :type018_user, :null => false
      t.belongs_to :type018_password_reset_url_notification, :index => false
      t.string :notice_token
      # t.string :email, :null => false
      # t.string :notice_token, :null => false
      # t.datetime :expired_at,   :null => false
      # t.datetime :used_at
      t.timestamps              :null => false
      # t.index :notice_token, :unique => true
    end
  end
end
