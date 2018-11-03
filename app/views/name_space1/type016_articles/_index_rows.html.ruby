current_records.collect {|e|
  {
    "ID"   => e.id,
    "名前" => e.name,
    "曜日(複)" => e.v1_teams.collect(&:name).join,
    "曜日(単)" => e.v2_type016_team_ship&.team&.name,
  }.merge({"操作" => [
        link_to("詳細", [*ns_prefix, e]),
        link_to("編集", [:edit, :name_space1, e]),
        (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_html
