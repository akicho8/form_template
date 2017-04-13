module NameSpace1
  class Type020SessionsController < ApplicationController
    include Type020HomesController::Type020UserSessionMethods

    def new
      @type020_user = Type020User.new(type020_user_params)
    end

    def create
      @type020_user = Type020User.new(type020_user_params)
      user = Type020User.find_by(email: @type020_user.email)
      unless user
        flash.now[:alert] = "メールアドレスが違う (本当は明示してはいけない)"
        render :new
        return
      end

      unless user.salted_password == user.salted_password_generate(@type020_user.password)
        flash.now[:alert] = "パスワードが違う (本当は明示してはいけない)"
        render :new
        return
      end

      return_to = session[:return_to]
      reset_session
      session[:type020_user_id] = user.id
      redirect_to (return_to || [:name_space1, :type020_home]), :notice => "ログインしました"
    end

    def destroy
      if current_type020_user
        notice = "ログアウトしました"
      else
        notice = "すでにログアウトしています"
      end
      reset_session
      redirect_to :root, :notice => notice
    end

    private

    def type020_user_params
      params.permit![:type020_user] || {}
    end
  end
end
