require 'rails_helper'

RSpec.describe "Type001Articles", type: :request do
  describe "GET /type001_articles" do
    it "works! (now write some real specs)" do
      get type001_articles_path
      expect(response).to have_http_status(200)
    end
  end
end
