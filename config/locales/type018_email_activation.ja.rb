{
  :ja => {
    :attributes => {
    },
    :helpers => {
      :submit => {
        :type018_email_activation => {
        }
      },
    },
    :activerecord => {
      :models => {
        :type018_email_activation => "メール認証",
      },
      :attributes => {
        :type018_email_activation => {
          :email          => "メールアドレス",
          :activate_token => "トークン",
          :expired_at     => "期限",
          :activated_at   => "本登録日時",
        },
      },
    },
  },
}
