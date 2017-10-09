current_records.collect {|e|
  {
    "メールアドレス" => link_to(e.email, [:new, :name_space1, :type020_user, activate_token: e.activate_token]),
    "本登録日時"     => e.activated_at&.to_s(:ymdhms),
    "本登録者数"     => e.type020_users.count,
  }.merge({"操作" => [
        link_to("本登録", [:new, :name_space1, :type020_user, activate_token: e.activate_token]),
        link_to("詳細", [:name_space1, e]),
        link_to("編集", [:edit, :name_space1, e]),
        (controller.respond_to_destroy? ? link_to("削除", [:name_space1, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
