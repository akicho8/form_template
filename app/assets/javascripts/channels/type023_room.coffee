App.type023_room = App.cable.subscriptions.create "Type023RoomChannel",
  connected: ->
    # 最初に呼ばれる
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # ここはどうやったら呼ばれる？
    # alert("disconnected")
    # Called when the subscription has been terminated by the server

  received: (data) ->
    canvas = document.getElementById("mycanvas")
    context = canvas.getContext("2d")

    radius = 24
    context.fillStyle = data["color"]
    context.fillRect(data["x"] - radius, data["y"] - radius, radius * 2, radius * 2)

  # 2. ここが呼ばれて
  type023_say: (type023_article_params) ->
    # FIXME: ruby を経由せずに ActionCable.server.broadcast("type023_room_channel", data) を呼べばもっと速いはず。どうすれば？
    @perform("type023_say", type023_article_params) # app/channels/type023_room_channel.rb の type023_say メソッドに処理が渡る

# これ、ここで書いていいの？
$ ->
  canvas = document.getElementById("mycanvas")
  color = canvas.dataset.color
  canvas.addEventListener "mousemove", (e) ->
    # ローカル座標に変換
    rect = e.target.getBoundingClientRect()
    x = e.clientX - rect.left
    y = e.clientY - rect.top
    App.type023_room.type023_say(x: x, y: y, color: color)
  , false
