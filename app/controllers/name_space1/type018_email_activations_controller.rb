# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証テーブル (type018_email_activations as Type018EmailActivation)
#
# +----------------+----------------+----------+-------------+------+-------+
# | カラム名       | 意味           | タイプ   | 属性        | 参照 | INDEX |
# +----------------+----------------+----------+-------------+------+-------+
# | id             | ID             | integer  | NOT NULL PK |      |       |
# | email          | メールアドレス | string   | NOT NULL    |      |       |
# | activate_token | トークン       | string   | NOT NULL    |      | A!    |
# | expired_at     | 期限           | datetime | NOT NULL    |      |       |
# | activated_at   | 本登録日時     | datetime |             |      |       |
# | created_at     | 作成日時       | datetime | NOT NULL    |      |       |
# | updated_at     | 更新日時       | datetime | NOT NULL    |      |       |
# +----------------+----------------+----------+-------------+------+-------+

module NameSpace1
  class Type018EmailActivationsController < ApplicationController
    include PlaggableCrud::All

    def page_header_show_title
      current_record.email
    end

    def raw_current_record
      super.tap do |e|
        e.email ||= "alice@localhost.net"
      end
    end
  end
end
