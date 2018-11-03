current_records.collect {|e|
  {
    "ID"   => link_to(e.id, [*ns_prefix, e]),
    "名前" => e.name,
    "曜日" => e.teams.collect(&:name).join,
  }.merge({"操作" => [
        link_to("詳細", [*ns_prefix, e]),
        link_to("編集", [:edit, :name_space1, e]),
        (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
