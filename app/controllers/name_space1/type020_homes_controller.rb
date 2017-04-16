module NameSpace1
  class Type020HomesController < ApplicationController
    # 実際は ApplicationController のような広域に定義する
    concerning :Type020UserSessionMethods do
      included do
        helper_method :current_type020_user
      end

      def current_type020_user_required
        if params[:logout]
          redirect_to({:logout => nil}, status: 401) # TODO: BASIC認証画面に切り替わらないのはなぜだろう
          return
        end

        session[:type020_user_id] = nil
        authenticate_or_request_with_http_basic do |email, password|
          Rails.logger.info({:email => email, :password => password}.inspect)
          if email.blank?
            # メールアドレスの入力がないので繰り返しダイアログ表示
            false
          else
            type020_user = Type020User.find_by(:email => email)
            unless type020_user
              # メールアドレスに対応するユーザーがないので、ユーザーを作成する。このときメールでパスワードを通知する。
              Type020User.create!(:email => email)
              false
            else
              if password.blank?
                # ユーザーがいてパスワードが空なら新しいパスワードを作って送る
                type020_user.update!(:password => nil)
                false
              else
                if type020_user.password == password
                  session[:type020_user_id] = type020_user.id # 毎回設定するのはアレだがまーいい
                  true
                else
                  false
                end
              end
            end
          end
        end
      end

      def current_type020_user
        if v = session[:type020_user_id]
          @current_type020_user ||= Type020User.find(v)
        end
      end
    end

    before_action :current_type020_user_required

    def show
    end
  end
end
