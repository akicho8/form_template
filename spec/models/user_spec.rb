# -*- coding: utf-8 -*-
# == Schema Information ==
#
# ユーザーテーブル (users as User)
#
# +------------------------+------------------------------+-------------+---------------------+------+-------+
# | カラム名               | 意味                         | タイプ      | 属性                | 参照 | INDEX |
# +------------------------+------------------------------+-------------+---------------------+------+-------+
# | id                     | ID                           | integer(8)  | NOT NULL PK         |      |       |
# | email                  | メールアドレス               | string(255) | DEFAULT() NOT NULL  |      | A!    |
# | encrypted_password     | ハッシュ化パスワード         | string(255) | DEFAULT() NOT NULL  |      |       |
# | reset_password_token   | パスワードリセット時トークン | string(255) |                     |      | B!    |
# | reset_password_sent_at | パスワードリセット日時       | datetime    |                     |      |       |
# | remember_created_at    | リマインダー作成日時         | datetime    |                     |      |       |
# | sign_in_count          | ログイン回数                 | integer(4)  | DEFAULT(0) NOT NULL |      |       |
# | current_sign_in_at     | 直近ログイン日時             | datetime    |                     |      |       |
# | last_sign_in_at        | 前回ログイン日時             | datetime    |                     |      |       |
# | current_sign_in_ip     | 直近ログインIP               | string(255) |                     |      |       |
# | last_sign_in_ip        | 前回ログインIP               | string(255) |                     |      |       |
# | confirmation_token     | Confirmation token           | string(255) |                     |      |       |
# | confirmed_at           | Confirmed at                 | datetime    |                     |      |       |
# | confirmation_sent_at   | Confirmation sent at         | datetime    |                     |      |       |
# | unconfirmed_email      | Unconfirmed email            | string(255) |                     |      |       |
# | nickname               | ニックネーム                 | string(255) |                     |      |       |
# | gender_key             | 性別                         | string(1)   |                     |      |       |
# | birthyear              | 生年                         | integer(4)  |                     |      |       |
# | prefecture_key         | 居住都道府県                 | string(2)   |                     |      |       |
# | avatar_file            | アイコン画像                 | string(255) |                     |      |       |
# | penname                | ペンネーム                   | string(255) |                     |      |       |
# | profile_body           | ユーザープロフィール             | text(65535) | NOT NULL            |      |       |
# | role_key               | ロール                       | string(255) | NOT NULL            |      | C     |
# | created_at             | 作成日時                     | datetime    | NOT NULL            |      |       |
# | updated_at             | 更新日時                     | datetime    | NOT NULL            |      |       |
# +------------------------+------------------------------+-------------+---------------------+------+-------+

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
