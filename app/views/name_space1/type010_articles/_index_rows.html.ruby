current_records.collect {|e|
  {
    "名前" => link_to(e.name, [*ns_prefix, e]),
    "画像" => e.type010_files.collect{|e| image_tag(e.media_file.url, height: "16") }.join(" ").html_safe,
    "操作" => [
      link_to("編集", [:edit, :name_space1, e]),
      (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete) : nil),
    ].compact.join(" ").html_safe,
  }
}.to_html
