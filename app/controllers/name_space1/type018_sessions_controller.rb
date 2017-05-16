module NameSpace1
  class Type018SessionsController < ApplicationController
    include Type018HomesController::Type018UserSessionMethods

    def new
      @type018_user = Type018User.new(type018_user_params)
    end

    def create
      @type018_user = Type018User.new(type018_user_params)
      user = Type018User.find_by(email: @type018_user.email)
      unless user
        flash.now[:alert] = "メールアドレスが違う (本当は明示してはいけない)"
        render :new
        return
      end

      unless user.salted_password == user.salted_password_generate(@type018_user.password)
        flash.now[:alert] = "パスワードが違う (本当は明示してはいけない)"
        render :new
        return
      end

      return_to = session[:return_to]
      reset_session
      session[:type018_user_id] = user.id
      redirect_to (return_to || [:name_space1, :type018_home]), notice: "ログインしました"
    end

    def destroy
      if current_type018_user
        notice = "ログアウトしました"
      else
        notice = "すでにログアウトしています"
      end
      reset_session
      redirect_to :root, notice: notice
    end

    private

    def type018_user_params
      params.permit![:type018_user] || {}
    end
  end
end
