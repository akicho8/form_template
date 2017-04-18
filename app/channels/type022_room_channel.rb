class Type022RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "type022_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def type022_say(data)
    # ActionCable.server.broadcast("type022_room_channel", type022_room_channel: data['message2'])
    Type022Article.create!(:body => data["type022_article_body"])
  end
end
