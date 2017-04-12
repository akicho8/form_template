# -*- coding: utf-8 -*-
# == Schema Information ==
#
# Type018 password reset url notificationテーブル (type018_password_reset_url_notifications as Type018PasswordResetUrlNotification)
#
# +-----------------+--------------+----------+-------------+-------------------+-------+
# | カラム名        | 意味         | タイプ   | 属性        | 参照              | INDEX |
# +-----------------+--------------+----------+-------------+-------------------+-------+
# | id              | ID           | integer  | NOT NULL PK |                   |       |
# | type018_user_id | Type018 user | integer  | NOT NULL    | => Type018User#id |       |
# | email           | Email        | string   | NOT NULL    |                   |       |
# | notice_token    | Notice token | string   | NOT NULL    |                   |       |
# | expired_at      | Expired at   | datetime | NOT NULL    |                   |       |
# | used_at         | Used at      | datetime |             |                   |       |
# | created_at      | 作成日時     | datetime | NOT NULL    |                   |       |
# | updated_at      | 更新日時     | datetime | NOT NULL    |                   |       |
# +-----------------+--------------+----------+-------------+-------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・【警告:インデックス欠如】create_type018_password_reset_url_notifications マイグレーションに add_index :type018_password_reset_url_notifications, :type018_user_id を追加してください
# ・Type018PasswordResetUrlNotification モデルは Type018User モデルから has_many :type018_password_reset_url_notifications されています。
#--------------------------------------------------------------------------------

class Type018PasswordResetUrlNotification < ApplicationRecord
  belongs_to :type018_user

  before_validation :on => :create do
    self.notice_token ||= SecureRandom.hex
    self.expired_at ||= 1.days.from_now
    if email
      self.type018_user ||= Type018User.find_by(:email => email)
    end
    true
  end

  with_options(:presence => true) do
    validates :type018_user
    validates :email
    validates :notice_token
  end

  after_create do
    Type018FooMailer.password_reset_url_notice_mail(self).deliver_now
  end
end
