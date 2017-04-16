# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証可能ユーザーテーブル (type020_users as Type020User)
#
# +------------+----------------+----------+-------------+------+-------+
# | カラム名   | 意味           | タイプ   | 属性        | 参照 | INDEX |
# +------------+----------------+----------+-------------+------+-------+
# | id         | ID             | integer  | NOT NULL PK |      |       |
# | email      | メールアドレス | string   | NOT NULL    |      | A!    |
# | password   | パスワード     | string   | NOT NULL    |      |       |
# | created_at | 作成日時       | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時       | datetime | NOT NULL    |      |       |
# +------------+----------------+----------+-------------+------+-------+

module NameSpace1
  class Type020UsersController < ApplicationController
    include PlaggableCrud::All
  end
end
