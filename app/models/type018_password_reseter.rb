# -*- coding: utf-8 -*-
# == Schema Information ==
#
# パスワード変更テーブル (type018_password_reseters as Type018PasswordReseter)
#
# +--------------------------------------------+-------------------------+----------+-------------+-------------------------------------------+-------+
# | カラム名                                   | 意味                    | タイプ   | 属性        | 参照                                      | INDEX |
# +--------------------------------------------+-------------------------+----------+-------------+-------------------------------------------+-------+
# | id                                         | ID                      | integer  | NOT NULL PK |                                           |       |
# | type018_user_id                            | ユーザーID              | integer  | NOT NULL    | => Type018User#id                         | A     |
# | type018_password_reset_url_notification_id | パスワード変更URL通知ID | integer  |             | => Type018PasswordResetUrlNotification#id |       |
# | notice_token                               | トークン                | string   |             |                                           |       |
# | created_at                                 | 作成日時                | datetime | NOT NULL    |                                           |       |
# | updated_at                                 | 更新日時                | datetime | NOT NULL    |                                           |       |
# +--------------------------------------------+-------------------------+----------+-------------+-------------------------------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type018PasswordReseter モデルは Type018User モデルから has_many :type018_password_reset_url_notifications されています。
# ・【警告:インデックス欠如】create_type018_password_reseters マイグレーションに add_index :type018_password_reseters, :type018_password_reset_url_notification_id を追加してください
# ・【警告:リレーション欠如】Type018PasswordResetUrlNotificationモデルで has_many :type018_password_reseters されていません
#--------------------------------------------------------------------------------

class Type018PasswordReseter < ApplicationRecord
  belongs_to :type018_user
  belongs_to :type018_password_reset_url_notification, required: false

  attr_accessor :second_password

  before_validation on: :create do
    self.type018_password_reset_url_notification ||= __current_type018_password_reset_url_notification
    if type018_password_reset_url_notification
      self.type018_user ||= type018_password_reset_url_notification.type018_user
    end
    true
  end

  with_options presence: true do
    validates :type018_user_id
  end
  with_options allow_blank: true do
    validates :notice_token, uniqueness: true
  end

  # after_create do
  #   Type018FooMailer.password_reset_url_notice_mail(self).deliver_now
  # end

  after_create do
    if second_password.present?
      type018_user.update!(password: second_password)
      Type018FooMailer.type018_password_reseter_mail(self).deliver_now
      if type018_password_reset_url_notification
        type018_password_reset_url_notification.update!(used_at: created_at)
      end
    end
  end

  def __current_type018_password_reset_url_notification
    if notice_token.present?
      e = Type018PasswordResetUrlNotification.find_by!(notice_token: notice_token)
      if e.expired_at >= Time.current
        unless e.used_at
          e
        end
      end
    end
  end
end
