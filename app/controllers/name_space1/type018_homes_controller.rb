module NameSpace1
  class Type018HomesController < ApplicationController
    # 実際は ApplicationController のような広域に定義する
    concerning :Type018UserSessionMethods do
      included do
        helper_method :current_type018_user
      end

      def current_type018_user
        if v = session[:type018_user_id].presence
          @current_type018_user ||= Type018User.find(v)
        end
      end

      def current_type018_user_required
        unless current_type018_user
          redirect_to [:new, :name_space1, :type018_session], alert: "ログインしてください"
        end
      end
    end

    before_action :current_type018_user_required

    def show
    end
  end
end
