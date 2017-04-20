current_records.collect {|e|
  {
    "住所" => link_to(e.map_address, [:name_space1, e, :show_partial => :show2]),
  }.merge({"操作" => [
        link_to("シンプル表示", [:name_space1, e]),
        link_to("いろいろ表示", [:name_space1, e, :show_partial => :show2]),
        link_to("編集", [:edit, :name_space1, e]),
        (controller.respond_to_destroy? ? link_to("削除", [:name_space1, e], :method => :delete, :data => {:confirm => "本当に削除してもよろしいですか？"}) : nil),
      ].compact.join(" ").html_safe})
}.to_quick_table
