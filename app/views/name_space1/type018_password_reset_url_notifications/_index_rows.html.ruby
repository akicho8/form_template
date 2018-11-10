current_records.collect {|e|
  {
    "ID" => link_to(e.id, [*ns_prefix, e]),
    "ユーザー" => link_to(e.type018_user.handle_name, [*ns_prefix, e.type018_user]),
    "メールアドレス" => e.email,
    "トークン" => e.notice_token,
    "作成日時" => time_ago_in_words(e.created_at) + "前",
  }.merge({"操作" => [
        link_to("PW再設定", [:new, *ns_prefix, :type018_password_reseter, type018_password_reseter: {notice_token: e.notice_token}]),
        link_to("メール確認", "/rails/mailers/type018_foo/password_reset_url_notice_mail"),
        link_to("詳細", [*ns_prefix, e]),
        link_to("編集", [:edit, *ns_prefix, e]),
        (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
