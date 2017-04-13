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

    # def page_header_show_title
    #   current_record.handle_name
    # end

    # def raw_current_record
    #   super.tap do |e|
    #     e.handle_name ||= "#{current_model.count.next}人目のユーザー"
    #     e.type020_email_activation ||= current_type020_email_activation
    #     unless e.email
    #       if e.type020_email_activation
    #         e.email ||= e.type020_email_activation.email
    #       else
    #         e.email ||= "direct.user#{current_model.count.next}@localhost.net"
    #       end
    #     end
    #     if e.new_record?
    #       e.password ||= "password"
    #     end
    #   end
    # end
    # 
    # def current_type020_email_activation
    #   if params[:activate_token].present?
    #     if v = Type020EmailActivation.find_by(:activate_token => params[:activate_token])
    #       if v.expired_at >= Time.current
    #         unless v.activated_at
    #           v
    #         end
    #       end
    #     end
    #   end
    # end
  end
end
