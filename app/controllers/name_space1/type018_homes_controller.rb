module NameSpace1
  class Type018HomesController < ApplicationController
    # 実際は ApplicationController のような広域に定義する
    concerning :CurrentUserMethods do
      included do
        helper_method :current_user
      end

      def current_user
        if v = session[:type018_user_id].presence
          @current_user ||= Type018User.find(v)
        end
      end

      def current_user_required
        unless current_user
          redirect_to [:new, :name_space1, :type018_session], :alert => "ログインしてください"
        end
      end
    end

    before_action :current_user_required

    def show
    end
  end
end
