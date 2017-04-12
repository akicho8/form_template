{
  :ja => {
    :attributes => {
    },
    :helpers => {
      :submit => {
        :type018_user => {
        }
      },
    },
    :activerecord => {
      :models => {
        :type018_user                            => "メール認証可能ユーザー",
        :type018_email_activation                => "メール認証",
        :type018_password_reset_url_notification => "パスワード変更URL通知",
        :type018_password_reseter                => "パスワード変更",
      },
      :attributes => {
        :type018_user => {
          :handle_name     => "名前",
          :email           => "メールアドレス",
          :password        => "パスワード",
          :salt            => "塩",
          :salted_password => "ハッシュ化パスワード",
        },
        :type018_email_activation => {
          :email          => "メールアドレス",
          :activate_token => "トークン",
          :expired_at     => "期限",
          :activated_at   => "本登録日時",
        },
        :type018_password_reset_url_notification => {
          :type018_user_id => "ユーザー",
          :email           => "メールアドレス",
          :notice_token    => "トークン",
          :expired_at      => "有効期限",
          :used_at         => "パスワード変更日時",
        },
        :type018_password_reseter => {
          :type018_user                            => "ユーザー",
          :type018_password_reset_url_notification => "パスワード変更URL通知",
          :notice_token                            => "トークン",
        },
      },
    },
  },
}
