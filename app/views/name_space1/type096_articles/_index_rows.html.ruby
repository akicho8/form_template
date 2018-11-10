current_records.collect {|e|
  {
    "ID"   => e.id,
    "名前" => e.name,
    "曜日" => e.type096_team_ships.collect{|e|"(#{e.team.name} . #{e.legal_accept_key})"}.join(" "),
  }.merge({"操作" => [
        link_to("詳細", [*ns_prefix, e]),
        link_to("編集", [:edit, *ns_prefix, e]),
        (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
