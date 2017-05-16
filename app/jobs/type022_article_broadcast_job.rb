class Type022ArticleBroadcastJob < ApplicationJob
  queue_as :default

  def perform(type022_article)
    ActionCable.server.broadcast("type022_room_channel", type022_article_body: render_html(type022_article))
  end

  private

  def render_html(type022_article)
    ApplicationController.renderer.render(partial: "name_space1/type022_chat_rooms/type022_article", locals: {type022_article: type022_article})
  end
end
