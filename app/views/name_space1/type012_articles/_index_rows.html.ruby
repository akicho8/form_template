current_records.collect {|e|
  {
    "タイトル" => link_to(e.comment0, [*ns_prefix, e]),
    "コメント数" => e.type012_s1_articles.count,
    "操作" => [
      link_to("編集", [:edit, *ns_prefix, e]),
      (controller.respond_to_destroy? ? link_to("削除", [*ns_prefix, e], method: :delete) : nil),
    ].compact.join(" ").html_safe,
  }
}.to_html
