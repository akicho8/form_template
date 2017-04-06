require 'rails_helper'

RSpec.describe "Type017Articles", type: :request do
  describe "GET /type017_articles" do
    it "works! (now write some real specs)" do
      get type017_articles_path
      expect(response).to have_http_status(200)
    end
  end
end
