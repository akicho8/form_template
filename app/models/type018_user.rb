# -*- coding: utf-8 -*-
# == Schema Information ==
#
# メール認証可能ユーザーテーブル (type018_users as Type018User)
#
# |-----------------------------+--------------------------+----------+-------------+------------------------------+-------|
# | カラム名                    | 意味                     | タイプ   | 属性        | 参照                         | INDEX |
# |-----------------------------+--------------------------+----------+-------------+------------------------------+-------|
# | id                          | ID                       | integer  | NOT NULL PK |                              |       |
# | type018_email_activation_id | Type018 email activation | integer  |             | => Type018EmailActivation#id | B     |
# | handle_name                 | 名前                     | string   | NOT NULL    |                              |       |
# | email                       | メールアドレス           | string   | NOT NULL    |                              | A!    |
# | salt                        | 塩                       | string   | NOT NULL    |                              |       |
# | salted_password             | ハッシュ化パスワード     | string   | NOT NULL    |                              |       |
# | created_at                  | 作成日時                 | datetime | NOT NULL    |                              |       |
# | updated_at                  | 更新日時                 | datetime | NOT NULL    |                              |       |
# |-----------------------------+--------------------------+----------+-------------+------------------------------+-------|
#
#- 備考 -------------------------------------------------------------------------
# ・Type018User モデルは Type018EmailActivation モデルから has_many :type018_users されています。
#--------------------------------------------------------------------------------

class Type018User < ApplicationRecord
  concerning :ActivateMethods do
    included do
      belongs_to :type018_email_activation, required: false # メール認証を必須にする場合は true にすること

      # TODO: こっちに activate_token アクセサを定義するとコントローラーはもっとシンプルになるか……？

      # メールアドレスの指定がなければメール認証のレコードから調達する
      before_validation on: :create do
        if type018_email_activation
          self.email ||= type018_email_activation.email
        end
        true
      end

      before_validation do
        self.salt ||= SecureRandom.hex
        if password.present?
          self.salted_password = salted_password_generate(password)
        end
        true
      end

      with_options(presence: true) do
        validates :email
        validates :salt
        validates :salted_password
      end

      with_options(allow_blank: true) do
        validates :email, uniqueness: true
      end

      after_create do
        # メール認証経由ならメール認証側のレコードに使用済みマークをつける
        if type018_email_activation
          type018_email_activation.update!(activated_at: created_at)
        end
        Type018FooMailer.welcome_mail(self).deliver_now
      end
    end

    attr_accessor :password

    def salted_password_generate(password)
      papper = "67f641e55ecf6b62ac665ae8fcbc438f"
      stretch = 10000
      stretch.times.inject("") do |a, i|
        Digest::SHA1.hexdigest([a, password, salt, papper, i].join("_"))
      end
    end
  end

  # 「パスワードを忘れた」関連
  concerning :ForgetPasswordMethods do
    included do
      with_options(dependent: :destroy) do
        has_many :type018_password_reset_url_notifications
        has_many :type018_password_reseters
      end
    end
  end
end
