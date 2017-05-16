class Type022RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "type022_room_channel"
  end

  # なにこれ？
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # モデルに保存して非同期でブロードキャストする
  def type022_say(data)
    Type022Article.create!(body: data["type022_article_body"])
  end
end
