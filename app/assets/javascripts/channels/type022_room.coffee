App.type022_room = App.cable.subscriptions.create "Type022RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there"s incoming data on the websocket for this channel
    # alert data["message"]
    $("#type022_articles").append(data["type022_article_body"])

  type022_say: (type022_article_body) ->
    @perform("type022_say", type022_article_body: type022_article_body)

$(document).on "keypress", "[data-behavior~=type022_room_speaker]", (event) ->
  if event.keyCode is 13 # return = send
    App.type022_room.type022_say(event.target.value)
    event.target.value = ""
    event.preventDefault()
