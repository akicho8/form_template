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
# | activate_token | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# +--------------+----------+----------+-------------+------+-------+

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
