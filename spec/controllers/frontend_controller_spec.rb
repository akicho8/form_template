require 'rails_helper'

RSpec.describe FrontendController, type: :controller do

  describe "GET #my_react001" do
    it "returns http success" do
      get :my_react001
      expect(response).to have_http_status(:success)
    end
  end

end
