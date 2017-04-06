# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 住所からGoogleマップ表示テーブル (type017_articles as Type017Article)
#
# +--------------+----------+----------+-------------+------+-------+
# | カラム名     | 意味     | タイプ   | 属性        | 参照 | INDEX |
# +--------------+----------+----------+-------------+------+-------+
# | id           | ID       | integer  | NOT NULL PK |      |       |
# | map_address  | 住所     | string   |             |      |       |
# | geocode_hash | 住所情報 | text     |             |      |       |
# | created_at   | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at   | 更新日時 | datetime | NOT NULL    |      |       |
# +--------------+----------+----------+-------------+------+-------+

require 'rails_helper'

RSpec.describe NameSpace1::Type017ArticlesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Type017Article. As you add validations to Type017Article, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    # {:subject => "(subject)", :body => "(body)"}
    {}
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Type017ArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all type017_articles as @type017_articles" do
      type017_article = Type017Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:type017_articles)).to eq([type017_article])
    end
  end

  describe "GET #show" do
    it "assigns the requested type017_article as @type017_article" do
      type017_article = Type017Article.create! valid_attributes
      get :show, params: {id: type017_article.to_param}, session: valid_session
      expect(assigns(:type017_article)).to eq(type017_article)
    end
  end

  describe "GET #new" do
    it "assigns a new type017_article as @type017_article" do
      get :new, params: {}, session: valid_session
      expect(assigns(:type017_article)).to be_a_new(Type017Article)
    end
  end

  describe "GET #edit" do
    it "assigns the requested type017_article as @type017_article" do
      type017_article = Type017Article.create! valid_attributes
      get :edit, params: {id: type017_article.to_param}, session: valid_session
      expect(assigns(:type017_article)).to eq(type017_article)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Type017Article" do
        expect {
          post :create, params: {type017_article: valid_attributes}, session: valid_session
        }.to change(Type017Article, :count).by(1)
      end

      it "assigns a newly created type017_article as @type017_article" do
        post :create, params: {type017_article: valid_attributes}, session: valid_session
        expect(assigns(:type017_article)).to be_a(Type017Article)
        expect(assigns(:type017_article)).to be_persisted
      end

      it "redirects to the created type017_article" do
        post :create, params: {type017_article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Type017Article.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved type017_article as @type017_article" do
        post :create, params: {type017_article: invalid_attributes}, session: valid_session
        expect(assigns(:type017_article)).to be_a_new(Type017Article)
      end

      it "re-renders the 'new' template" do
        post :create, params: {type017_article: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested type017_article" do
        type017_article = Type017Article.create! valid_attributes
        put :update, params: {id: type017_article.to_param, type017_article: new_attributes}, session: valid_session
        type017_article.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested type017_article as @type017_article" do
        type017_article = Type017Article.create! valid_attributes
        put :update, params: {id: type017_article.to_param, type017_article: valid_attributes}, session: valid_session
        expect(assigns(:type017_article)).to eq(type017_article)
      end

      it "redirects to the type017_article" do
        type017_article = Type017Article.create! valid_attributes
        put :update, params: {id: type017_article.to_param, type017_article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(type017_article)
      end
    end

    context "with invalid params" do
      it "assigns the type017_article as @type017_article" do
        type017_article = Type017Article.create! valid_attributes
        put :update, params: {id: type017_article.to_param, type017_article: invalid_attributes}, session: valid_session
        expect(assigns(:type017_article)).to eq(type017_article)
      end

      it "re-renders the 'edit' template" do
        type017_article = Type017Article.create! valid_attributes
        put :update, params: {id: type017_article.to_param, type017_article: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested type017_article" do
      type017_article = Type017Article.create! valid_attributes
      expect {
        delete :destroy, params: {id: type017_article.to_param}, session: valid_session
      }.to change(Type017Article, :count).by(-1)
    end

    it "redirects to the type017_articles list" do
      type017_article = Type017Article.create! valid_attributes
      delete :destroy, params: {id: type017_article.to_param}, session: valid_session
      expect(response).to redirect_to(type017_articles_url)
    end
  end
end
