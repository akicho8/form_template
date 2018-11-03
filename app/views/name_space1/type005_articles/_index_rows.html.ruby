current_records.collect {|e|
  {
    current_model.human_attribute_name(:title) => link_to(e.title, [*ns_prefix, e]),
    "画像"     => e.type005_files.collect{|e| image_tag(e.media_file.url, height: "16") }.join(" ").html_safe,
    "操作" => [
      link_to("詳細", [*ns_prefix, e]),
      link_to("編集", [:edit, :name_space1, e]),
      (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete, data: {confirm: "本当に削除してもよろしいですか？"}) : nil),
    ].compact.join(" ").html_safe,
  }
}.to_html
