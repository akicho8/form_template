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

class Type020User < ApplicationRecord
  before_validation on: :create do
    self.password ||= SecureRandom.hex
    true
  end

  with_options(presence: true) do
    validates :email
  end
  with_options(allow_blank: true) do
    validates :email, uniqueness: true
  end

  after_create do
    Type020FooMailer.type020_user_created_mail(self)
  end

  after_update do
    if changes[:password]
      Type020FooMailer.type020_user_created_mail(self)
    end
  end
end
