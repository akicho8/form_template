current_records.collect {|e|
  {
    "名前" => link_to(e.handle_name, [controller.class.parent_name.underscore, e]),
    "メールアドレス" => e.email,
    "パス忘れた数" => e.type018_password_reset_url_notifications.count,
    "パス再設定数" => e.type018_password_reseters.count,
  }.merge({"操作" => [
        link_to("ログイン", [:new, controller.class.parent_name.underscore, :type018_session, :type018_user => {:email => e.email, :password => "password"}]),
        link_to("PWリセットURL通知", [:new, controller.class.parent_name.underscore, :type018_password_reset_url_notification, :type018_password_reset_url_notification => {:email => e.email}]),
        link_to("直接PWリセット(ログイン中ユーザー専用)", [:new, controller.class.parent_name.underscore, :type018_password_reseter]),
        link_to("詳細", [controller.class.parent_name.underscore, e]),
        link_to("編集", [:edit, controller.class.parent_name.underscore, e]),
        (controller.respond_to_destroy? ? link_to("削除", [controller.class.parent_name.underscore, e], :method => :delete, :data => {:confirm => "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_quick_table
