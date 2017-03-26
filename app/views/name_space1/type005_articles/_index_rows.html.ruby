current_records.collect {|e|
  {
    current_model.human_attribute_name(:title) => link_to(e.title, [controller.class.parent_name.underscore, e]),
    "画像"     => e.type005_files.collect{|e| image_tag(e.pixer.url, :height => "16") }.join(" ").html_safe,
    "操作" => [
      link_to("詳細", [controller.class.parent_name.underscore, e]),
      link_to("編集", [:edit, controller.class.parent_name.underscore, e]),
      (controller.respond_to_destroy? ? link_to("削除", [controller.class.parent_name.underscore, e], :method => :delete, :data => {:confirm => "本当に削除してもよろしいですか？"}) : nil),
    ].compact.join(" ").html_safe,
  }
}.to_quick_table
