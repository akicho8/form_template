$ ->
  # $("#type029_slider_jquery_ajax_call").on "change", (e) ->
  $(document).on "change", "#type029_slider_hidden_submit_click", (e) ->
    # form を直接 submit したかったが AJAX ではなくなってしまうため、隠しておいた submit タグをクリックしている
    $(e.target).parents("form").find("input[type=submit]").click()

  # $("#type029_slider_jquery_ajax_call").on "change", (e) ->
  $(document).on "change", "#type029_slider_jquery_ajax_call", (e) ->
    slider = e.target
    serialize = $(e.target).parents("form").serialize() # serialize は form タグにしか効かないので注意
    # alert serialize
    $.ajax
      type: "get"
      url: slider.dataset.url
      dataType: "jsonp"
      data: serialize
