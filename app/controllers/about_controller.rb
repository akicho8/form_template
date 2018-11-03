class AboutController < ApplicationController
  def privacy_policy
    shared_action
  end

  def terms
    shared_action
  end

  def asct
    shared_action
  end

  private

  def shared_action
    render html: Rails.root.join("config/#{params[:action]}.txt").read.gsub(/\R/, "<br/>").html_safe
  end
end
