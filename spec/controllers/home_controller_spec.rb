require 'rails_helper'

RSpec.describe TopsController, type: :controller do
  describe "show" do
    it do
      get :show
      assert_response :success
    end
  end
end
