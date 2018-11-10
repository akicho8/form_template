current_records.collect {|e|
  {
    "名前" => link_to(e.handle_name, [*ns_prefix, e]),
    "メールアドレス" => e.email,
    "パス忘れた数" => e.type018_password_reset_url_notifications.count,
    "パス再設定数" => e.type018_password_reseters.count,
  }.merge({"操作" => [
        link_to("ログイン", [:new, *ns_prefix, :type018_session, type018_user: {email: e.email, password: "password"}]),
        link_to("PWリセットURL通知", [:new, *ns_prefix, :type018_password_reset_url_notification, type018_password_reset_url_notification: {email: e.email}]),
        link_to("直接PWリセット(ログイン中ユーザー専用)", [:new, *ns_prefix, :type018_password_reseter]),
        link_to("詳細", [*ns_prefix, e]),
        link_to("編集", [:edit, *ns_prefix, e]),
        (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
