$ ->
  $("#type029_slider").on "change", (e) ->
    slider = e.target
    serialize = $(e.target).parents("form").serialize() # serialize は form タグにしか効かないので注意
    alert serialize
    $.ajax
      type: "get"
      url: slider.dataset.url
      dataType: "jsonp"
      data: serialize
