class Type023RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "type023_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def type023_say(data)
    ActionCable.server.broadcast("type023_room_channel", data)
  end
end
