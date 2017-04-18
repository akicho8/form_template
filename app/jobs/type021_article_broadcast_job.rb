class Type021ArticleBroadcastJob < ApplicationJob
  queue_as :default

  def perform(type021_article)
    ActionCable.server.broadcast("type021_room_channel", type021_article_html: render_html(type021_article))
  end

  private

  def render_html(type021_article)
    ApplicationController.renderer.render(:partial => "name_space1/type021_chat_rooms/type021_article", :locals => {:type021_article => type021_article})
  end
end
