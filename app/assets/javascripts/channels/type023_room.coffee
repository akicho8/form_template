App.type023_room = App.cable.subscriptions.create "Type023RoomChannel",
  connected: ->
    # 最初に呼ばれる
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # ここはどうやったら呼ばれる？
    # alert("disconnected")
    # Called when the subscription has been terminated by the server

  received: (data) ->
    canvas = document.getElementById("chat_room_canvas")
    context = canvas.getContext("2d")
    context.globalAlpha = 0.05
    if data["buttons"] == 0
      context.globalCompositeOperation = "source-over"
    else
      context.globalCompositeOperation = "lighter"

    radius = 64
    context.lineWidth = 1
    context.beginPath()
    context.fillStyle = data["color"]
    context.arc(data["x"], data["y"], radius, 0, Math.PI*2, true)
    context.fill()

    # img02 = context.getImageData(0, 0, canvas.width, canvas.height)
    # # img02 = img02.scale(2.2, 1.2)
    # context.drawImage(img02, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width * 2, canvas.height * 2)


  # 2. ここが呼ばれて
  type023_say: (type023_article_params) ->
    # FIXME: ruby を経由せずに ActionCable.server.broadcast("type023_room_channel", data) を呼べばもっと速いはず。どうすれば？
    @perform("type023_say", type023_article_params) # app/channels/type023_room_channel.rb の type023_say メソッドに処理が渡る

# これ、ここで書いていいの？
$ ->
  canvas = document.getElementById("chat_room_canvas")
  if canvas
    color = canvas.dataset.color
    canvas.addEventListener "mousemove", (e) ->
      # ローカル座標に変換
      rect = e.target.getBoundingClientRect()
      x = e.clientX - rect.left
      y = e.clientY - rect.top
      App.type023_room.type023_say(x: x, y: y, color: color, buttons: e.buttons)
    , false
