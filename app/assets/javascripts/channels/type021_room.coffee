App.type021_room = App.cable.subscriptions.create "Type021RoomChannel",
  connected: ->
    # 最初に呼ばれる
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # ここはどうやったら呼ばれる？
    # alert("disconnected")
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there"s incoming data on the websocket for this channel
    # alert data["message"]
    $("#type021_articles").append(data["type021_article_html"])

  # 2. ここが呼ばれて
  type021_say: (type021_article_body) ->
    @perform("type021_say", type021_article_body: type021_article_body) # app/channels/type021_room_channel.rb の type021_say メソッドに処理が渡る

$(document).on "keypress", "[data-behavior~=type021_room_speaker]", (event) ->
  if event.keyCode is 13 # return = send
    App.type021_room.type021_say(event.target.value) # 1. ここが最初で
    event.target.value = ""
    event.preventDefault()
