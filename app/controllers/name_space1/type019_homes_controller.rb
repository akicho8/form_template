module NameSpace1
  class Type019HomesController < ApplicationController
    # 実際は ApplicationController のような広域に定義する
    concerning :Type019UserSessionMethods do
      included do
        helper_method :current_type019_user
      end

      def current_type019_user
        session[:type019_user].presence
      end

      def current_type019_user_required
        Rails.logger.info({:type019_user => session[:type019_user]}.inspect)
        # unless current_type019_user
        authenticate_or_request_with_http_basic do |name, password| # 毎回通るので session に入れる必要ない？
          Rails.logger.info({:name => name, :password => password}.inspect)
          if name.present?
            # if password == "pw"
            session[:type019_user] = name.strip.encode("UTF-8")
            Rails.logger.info({:type019_user => session[:type019_user]}.inspect)
            true
            # end
          else
            false
          end
        end
        # end
      end
    end

    before_action do
      if params[:logout]
        # session.delete(:type019_user)
        reset_session
        redirect_to :logout => nil
      end
    end

    before_action :current_type019_user_required

    def show
    end
  end
end
