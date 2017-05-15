# show.html.slim のなかで _show.html.slim を呼び出しているのでその領域だけを更新する
$("#show_partial_div_for_ajax").html("<%= j(render partial: 'show') %>")
$("#show_partial_div_for_ajax").append("app/views/name_space1/type029_articles/show.js.coffee を実行")

