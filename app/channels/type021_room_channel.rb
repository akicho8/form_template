# モデルに保存しない版
class Type021RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "type021_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 「モデルに保存して非同期でブロードキャスト」はしてない
  def type021_say(data)
    # HTMLを作る
    body = data["type021_article_body"]
    type021_article = {body: body, created_at: Time.current}
    # コントローラーを経由せずに直接ビューを利用してHTMLを作れる
    html = ApplicationController.renderer.render(partial: "name_space1/type021_chat_rooms/type021_article", locals: {type021_article: type021_article})

    # それを全員に通知
    # 各自の type021_room.coffee の received メソッドに引数が渡る
    ActionCable.server.broadcast("type021_room_channel", type021_article_html: html)
  end
end
