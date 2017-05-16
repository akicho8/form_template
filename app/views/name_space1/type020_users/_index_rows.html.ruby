current_records.collect {|e|
  {
    "メールアドレス" => e.email,
    "パスワード"     => e.password,
  }.merge({"操作" => [
        link_to("ホーム", [:name_space1, :type020_home]),
        # link_to("PWリセットURL通知", [:new, :name_space1, :type020_password_reset_url_notification, type020_password_reset_url_notification: {email: e.email}]),
        # link_to("直接PWリセット(ログイン中ユーザー専用)", [:new, :name_space1, :type020_password_reseter]),
        link_to("詳細", [:name_space1, e]),
        link_to("編集", [:edit, :name_space1, e]),
        (controller.respond_to_destroy? ? link_to("削除", [:name_space1, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_quick_table
