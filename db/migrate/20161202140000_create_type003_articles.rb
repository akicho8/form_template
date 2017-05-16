# -*- coding: utf-8 -*-
# == Schema Information ==
#
# もりだくさん個人情報登録テーブル (type003_articles as Type003Article)
#
# +---------------------+----------------------+----------+-------------+------+-------+
# | カラム名            | 意味                 | タイプ   | 属性        | 参照 | INDEX |
# +---------------------+----------------------+----------+-------------+------+-------+
# | id                  | ID                   | integer  | NOT NULL PK |      |       |
# | first_name          | 姓                   | string   | NOT NULL    |      |       |
# | last_name           | 名                   | string   | NOT NULL    |      |       |
# | first_name_hiragana | 姓(ふりがな)         | string   | NOT NULL    |      |       |
# | last_name_hiragana  | 名(ふりがな)         | string   | NOT NULL    |      |       |
# | first_postal_code   | 郵便番号(左)         | string   | NOT NULL    |      |       |
# | last_postal_code    | 郵便番号(右)         | string   | NOT NULL    |      |       |
# | prefecture_name     | 都道府県             | string   | NOT NULL    |      |       |
# | city_address        | 市区町村             | string   | NOT NULL    |      |       |
# | number_address      | 番地                 | string   | NOT NULL    |      |       |
# | house_name          | ビル名・部屋番号     | string   |             |      |       |
# | email               | 連絡先メールアドレス | string   | NOT NULL    |      | A!    |
# | first_tel           | 市外局番             | string   | NOT NULL    |      |       |
# | middle_tel          | 市内局番             | string   | NOT NULL    |      |       |
# | last_tel            | 加入者番号           | string   | NOT NULL    |      |       |
# | legal_accept_key    | プライバシーポリシー | string   | NOT NULL    |      |       |
# | subject             | 件名                 | string   |             |      |       |
# | body                | 内容                 | text     |             |      |       |
# | remote_ip           | Remote ip            | string   |             |      |       |
# | remote_host         | Remote host          | string   |             |      |       |
# | user_agent          | User agent           | string   |             |      |       |
# | created_at          | 登録日時             | datetime | NOT NULL    |      |       |
# | updated_at          | 更新日時             | datetime | NOT NULL    |      |       |
# +---------------------+----------------------+----------+-------------+------+-------+

class CreateType003Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type003_articles, force: true do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.string :first_name_hiragana, null: false
      t.string :last_name_hiragana, null: false

      t.string :first_postal_code, null: false
      t.string :last_postal_code, null: false

      t.string :prefecture_name, null: false
      t.string :city_address, null: false
      t.string :number_address, null: false
      t.string :house_name

      t.string :email, null: false, index: {unique: true}

      t.string :first_tel, null: false
      t.string :middle_tel, null: false
      t.string :last_tel, null: false

      t.string :legal_accept_key, null: false

      t.string :subject
      t.text :body

      t.string :remote_ip
      t.string :remote_host
      t.string :user_agent

      t.timestamps null: false
    end
  end
end
