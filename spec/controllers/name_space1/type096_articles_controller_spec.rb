# これは必要

require 'rails_helper'

RSpec.describe Type096ArticlesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it do
      get :create, params: {
        type096_article: {
          key: SecureRandom.hex,
          type096_team_ships_attributes: {
            "0": {"team_id": "1", "legal_accept_key": "true"},
            "1": {"team_id": "2", "legal_accept_key": "false"},
          },
        },
      }
      # tp Type096Article.last.type096_team_ships
      expect(Type096Article.last.type096_team_ships.count).to eq(2)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #edit" do
    it do
      get :edit, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    let(:type096_article) { Type096Article.find(1) }
    it do
      put :update, params: {
        id: type096_article.id,
        type096_article: {
          type096_team_ships_attributes: {
            "0": {id: 1, "legal_accept_key": "true"},
            "1": {id: 2, "legal_accept_key": "false"},
          },
        }
      }
      expect(response).to have_http_status(:redirect)
      expect(type096_article.type096_team_ships.find(2).legal_accept_key).to eq("false")
    end
  end
end
