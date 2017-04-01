current_records.collect {|e|
  {
    "ID"   => link_to(e.id, [controller.class.parent_name.underscore, e]),
    "名前" => e.name,
    "曜日" => e.teams.collect(&:name).join,
  }.merge({"操作" => [
        link_to("詳細", [controller.class.parent_name.underscore, e]),
        link_to("編集", [:edit, controller.class.parent_name.underscore, e]),
        (controller.respond_to_destroy? ? link_to("削除", [controller.class.parent_name.underscore, e], :method => :delete, :data => {:confirm => "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_quick_table
