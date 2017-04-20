require 'rails_helper'

RSpec.describe FrontendController, type: :controller do

  describe "GET #type024_article" do
    it "returns http success" do
      get :type024_article
      expect(response).to have_http_status(:success)
    end
  end

end
