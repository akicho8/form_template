# -*- coding: utf-8 -*-
# == Schema Information ==
#
# パスワード変更URL通知テーブル (type018_password_reset_url_notifications as Type018PasswordResetUrlNotification)
#
# +-----------------+--------------------+----------+-------------+-------------------+-------+
# | カラム名        | 意味               | タイプ   | 属性        | 参照              | INDEX |
# +-----------------+--------------------+----------+-------------+-------------------+-------+
# | id              | ID                 | integer  | NOT NULL PK |                   |       |
# | type018_user_id | ユーザー           | integer  | NOT NULL    | => Type018User#id |       |
# | email           | メールアドレス     | string   | NOT NULL    |                   |       |
# | notice_token    | トークン           | string   | NOT NULL    |                   |       |
# | expired_at      | 有効期限           | datetime | NOT NULL    |                   |       |
# | used_at         | パスワード変更日時 | datetime |             |                   |       |
# | created_at      | 作成日時           | datetime | NOT NULL    |                   |       |
# | updated_at      | 更新日時           | datetime | NOT NULL    |                   |       |
# +-----------------+--------------------+----------+-------------+-------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・【警告:インデックス欠如】create_type018_password_reset_url_notifications マイグレーションに add_index :type018_password_reset_url_notifications, :type018_user_id を追加してください
# ・Type018PasswordResetUrlNotification モデルは Type018User モデルから has_many :type018_password_reset_url_notifications されています。
#--------------------------------------------------------------------------------

module NameSpace1
  class Type018PasswordResetUrlNotificationsController < ApplicationController
    include PluggableCrud::All

    # def page_header_show_title
    #   "ログインに使っているメールアドレスを入力してください"
    # end

    # def raw_current_record
    #   super.tap do |e|
    #     e.email ||= "email.user#{Type018User.count.next}@localhost.net"
    #   end
    # end
  end
end

# # == Schema Information
# #
# # パスワードリマインダテーブル (email_verifications)
# #
# # +----------+--------------+-------------+------+----------------+
# # | カラム名 | 意味         | タイプ      | 属性 | 外部参照       |
# # +----------+--------------+-------------+------+----------------+
# # | user_id  | ユーザID     | integer(11) |      | => User#id     |
# # | token    | 信用トークン | string(255) |      |                |
# # | type     | 対応モデル   | string(255) |      | 何かのモデル名 |
# # +----------+--------------+-------------+------+----------------+
# 
# class PasswordRemindersController < ApplicationController
#   ssl_required :edit, :update
# 
#   # PW再設定用URL発行フォーム
#   def new
#     @user = User.new(params[:user])
#     if logged_in?
#       @user.email ||= current_type018_user.email
#     end
#     if AppConfig[:form_fillin]
#       @user.email ||= "alice@localhost.localdomain"
#     end
#     render action: "new"
#   end
# 
#   # PW再設定用URL発行
#   def create
#     user = User.active.first(conditions: {email: params[:user][:email]})
#     unless user
#       flash.now[:error] = "メールアドレスが間違っている可能性があります。"
#       new
#       return
#     end
#     password_reminder = user.password_reminders.create!
#     flash[:notice] = "ご指定のメールアドレスにPW再設定用のURLを送りました。"
#     if AppConfig[:form_fillin]
#       flash[:notice] += "<br/>#{password_reminder.url}"
#     end
#     if AppConfig[:simply]
#       redirect_to root_path
#     else
#       redirect_to message_path
#     end
#   end
# 
#   # パスワード更新フォーム
#   def edit
#     password_reminder = PasswordReminder.authenticate(params[:token])
#     @user = password_reminder.user
#     flash.now[:message] = "パスワードを再設定してください。"
#     if AppConfig[:form_fillin]
#       @user.password = "password#{Time.current.sec}"
#       @user.password_confirmation = @user.password
#     end
#   end
# 
#   # パスワード更新
#   def update
#     password_reminder = PasswordReminder.authenticate(params[:token])
#     @user = password_reminder.user
#     @user.new_password = true
#     @user.update_attributes!(params[:user])
#     flash[:notice] = "パスワードを更新しました。"
#     if AppConfig[:simply]
#       redirect_to ssl_login_url(user: {login: @user.login})
#     else
#       redirect_to message_path
#     end
#   end
# end
