class Type021RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "type021_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 「モデルに保存して非同期でブロードキャスト」はしてない
  def type021_say(data)
    body = data['type021_article_body']
    type021_article = {:body => body, :created_at => Time.current}
    html = ApplicationController.renderer.render(:partial => "name_space1/type021_chat_rooms/type021_article", :locals => {:type021_article => type021_article})
    ActionCable.server.broadcast("type021_room_channel", type021_article_html: html)
  end
end
