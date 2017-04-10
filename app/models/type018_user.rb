# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証可能ユーザーテーブル (type018_users as Type018User)
#
# +-----------------------------+----------------------+----------+-------------+------------------------------+-------+
# | カラム名                    | 意味                 | タイプ   | 属性        | 参照                         | INDEX |
# +-----------------------------+----------------------+----------+-------------+------------------------------+-------+
# | id                          | ID                   | integer  | NOT NULL PK |                              |       |
# | type018_email_activation_id | メール認証ID         | integer  |             | => Type018EmailActivation#id | B     |
# | handle_name                 | 名前                 | string   | NOT NULL    |                              |       |
# | email                       | メールアドレス       | string   | NOT NULL    |                              | A!    |
# | salt                        | 塩                   | string   | NOT NULL    |                              |       |
# | hashed_password             | ハッシュ化パスワード | string   | NOT NULL    |                              |       |
# | created_at                  | 作成日時             | datetime | NOT NULL    |                              |       |
# | updated_at                  | 更新日時             | datetime | NOT NULL    |                              |       |
# +-----------------------------+----------------------+----------+-------------+------------------------------+-------+
#
#- 備考 -------------------------------------------------------------------------
# ・Type018User モデルは Type018EmailActivation モデルから has_many :type018_users されています。
#--------------------------------------------------------------------------------

class Type018User < ApplicationRecord
  belongs_to :type018_email_activation, required: false # メール認証を必須にする場合は true にすること

  attr_accessor :password

  # TODO: こっちに activate_token アクセサを定義するとコントローラーはもっとシンプルになる

  # メールアドレスの指定がなければメール認証のレコードから調達する
  before_validation :on => :create do
    if type018_email_activation
      self.email ||= type018_email_activation.email
    end
    true
  end

  before_validation do
    self.salt ||= SecureRandom.hex
    if password.present?
      self.hashed_password = hashed_password_generate(password)
    end
    true
  end

  with_options(:presence => true) do
    validates :handle_name
    validates :email
    validates :salt
    validates :hashed_password
  end

  with_options(:allow_blank => true) do
    validates :email, :uniqueness => true
  end

  # メール認証で自分が作られたらメール認証側のレコードに使用済みの日付を入れておく
  after_create do
    if type018_email_activation
      type018_email_activation.update!(:activated_at => created_at)
    end
  end

  def hashed_password_generate(password)
    papper = "67f641e55ecf6b62ac665ae8fcbc438f"
    stretch = 103
    value = nil
    stretch.times { value = Digest::SHA1.hexdigest([value, password, salt, papper].join("_")) }
    value
  end
end
