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

class Type018EmailActivation < ApplicationRecord
  has_many :type018_users, :dependent => :restrict_with_exception

  with_options(:presence => true) do
    validates :email
    validates :activate_token
  end

  before_validation :on => :create do
    self.activate_token ||= SecureRandom.hex
    self.expired_at ||= 1.days.from_now
    true
  end

  after_create do
    Type018FooMailer.activation_mail(self).deliver_now
  end
end
