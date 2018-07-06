# -*- coding: utf-8 -*-
# == Schema Information ==
#
# 件名と本文のみテーブル (type001_articles as Type001Article)
#
# |------------+----------+----------+-------------+------+-------|
# | カラム名   | 意味     | タイプ   | 属性        | 参照 | INDEX |
# |------------+----------+----------+-------------+------+-------|
# | id         | ID       | integer  | NOT NULL PK |      |       |
# | subject    | 件名     | string   |             |      |       |
# | body       | 内容     | text     |             |      |       |
# | created_at | 作成日時 | datetime | NOT NULL    |      |       |
# | updated_at | 更新日時 | datetime | NOT NULL    |      |       |
# |------------+----------+----------+-------------+------+-------|

require 'rails_helper'

RSpec.describe NameSpace1::Type001ArticlesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Type001Article. As you add validations to Type001Article, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    # {subject: "(subject)", body: "(body)"}
    {}
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Type001ArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all type001_articles as @type001_articles" do
      type001_article = Type001Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:type001_articles)).to eq([type001_article])
    end
  end

  describe "GET #show" do
    it "assigns the requested type001_article as @type001_article" do
      type001_article = Type001Article.create! valid_attributes
      get :show, params: {id: type001_article.to_param}, session: valid_session
      expect(assigns(:type001_article)).to eq(type001_article)
    end
  end

  describe "GET #new" do
    it "assigns a new type001_article as @type001_article" do
      get :new, params: {}, session: valid_session
      expect(assigns(:type001_article)).to be_a_new(Type001Article)
    end
  end

  describe "GET #edit" do
    it "assigns the requested type001_article as @type001_article" do
      type001_article = Type001Article.create! valid_attributes
      get :edit, params: {id: type001_article.to_param}, session: valid_session
      expect(assigns(:type001_article)).to eq(type001_article)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Type001Article" do
        expect {
          post :create, params: {type001_article: valid_attributes}, session: valid_session
        }.to change(Type001Article, :count).by(1)
      end

      it "assigns a newly created type001_article as @type001_article" do
        post :create, params: {type001_article: valid_attributes}, session: valid_session
        expect(assigns(:type001_article)).to be_a(Type001Article)
        expect(assigns(:type001_article)).to be_persisted
      end

      it "redirects to the created type001_article" do
        post :create, params: {type001_article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Type001Article.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved type001_article as @type001_article" do
        post :create, params: {type001_article: invalid_attributes}, session: valid_session
        expect(assigns(:type001_article)).to be_a_new(Type001Article)
      end

      it "re-renders the 'new' template" do
        post :create, params: {type001_article: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested type001_article" do
        type001_article = Type001Article.create! valid_attributes
        put :update, params: {id: type001_article.to_param, type001_article: new_attributes}, session: valid_session
        type001_article.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested type001_article as @type001_article" do
        type001_article = Type001Article.create! valid_attributes
        put :update, params: {id: type001_article.to_param, type001_article: valid_attributes}, session: valid_session
        expect(assigns(:type001_article)).to eq(type001_article)
      end

      it "redirects to the type001_article" do
        type001_article = Type001Article.create! valid_attributes
        put :update, params: {id: type001_article.to_param, type001_article: valid_attributes}, session: valid_session
        expect(response).to redirect_to(type001_article)
      end
    end

    context "with invalid params" do
      it "assigns the type001_article as @type001_article" do
        type001_article = Type001Article.create! valid_attributes
        put :update, params: {id: type001_article.to_param, type001_article: invalid_attributes}, session: valid_session
        expect(assigns(:type001_article)).to eq(type001_article)
      end

      it "re-renders the 'edit' template" do
        type001_article = Type001Article.create! valid_attributes
        put :update, params: {id: type001_article.to_param, type001_article: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested type001_article" do
      type001_article = Type001Article.create! valid_attributes
      expect {
        delete :destroy, params: {id: type001_article.to_param}, session: valid_session
      }.to change(Type001Article, :count).by(-1)
    end

    it "redirects to the type001_articles list" do
      type001_article = Type001Article.create! valid_attributes
      delete :destroy, params: {id: type001_article.to_param}, session: valid_session
      expect(response).to redirect_to(type001_articles_url)
    end
  end
end
