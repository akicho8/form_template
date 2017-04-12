# -*- coding: utf-8 -*-
# == Schema Information ==
#
# Type018 password reseterテーブル (type018_password_reseters as Type018PasswordReseter)
#
# +--------------------------------------------+-----------------------------------------+----------+-------------+-------------------------------------------+-------+
# | カラム名                                   | 意味                                    | タイプ   | 属性        | 参照                                      | INDEX |
# +--------------------------------------------+-----------------------------------------+----------+-------------+-------------------------------------------+-------+
# | id                                         | ID                                      | integer  | NOT NULL PK |                                           |       |
# | type018_user_id                            | Type018 user                            | integer  | NOT NULL    | => Type018User#id                         | A     |
# | type018_password_reset_url_notification_id | Type018 password reset url notification | integer  |             | => Type018PasswordResetUrlNotification#id |       |
# | notice_token                               | Notice token                            | string   |             |                                           |       |
# | created_at                                 | 作成日時                                | datetime | NOT NULL    |                                           |       |
# | updated_at                                 | 更新日時                                | datetime | NOT NULL    |                                           |       |
# +--------------------------------------------+-----------------------------------------+----------+-------------+-------------------------------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type018PasswordReseter モデルは Type018User モデルから has_many :type018_password_reset_url_notifications されています。
# ・【警告:インデックス欠如】create_type018_password_reseters マイグレーションに add_index :type018_password_reseters, :type018_password_reset_url_notification_id を追加してください
# ・【警告:リレーション欠如】Type018PasswordResetUrlNotificationモデルで has_many :type018_password_reseters されていません
#--------------------------------------------------------------------------------

module NameSpace1
  class Type018PasswordResetersController < ApplicationController
    include PlaggableCrud::All
    include Type018HomesController::Type018UserSessionMethods

    before_action do
      # __current_type018_password_reset_url_notification はここに展開する方がいい？
      if current_record.notice_token.present?
        unless current_record.__current_type018_password_reset_url_notification
          redirect_to :root, :alert => "とりあえずページが見つかりません。実際は期限切れでここにくる"
        end
      end
    end

    # def page_header_show_title
    #   current_record.email
    # end

    def raw_current_record
      super.tap do |e|
        # ログイン中ならトークンなしでOK
        if current_type018_user
          e.type018_user ||= current_type018_user
        end
        e.atarasii_password ||= "pw2"
      end
    end

    # current_record

  end
end
