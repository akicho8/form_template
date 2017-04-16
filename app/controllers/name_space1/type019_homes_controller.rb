module NameSpace1
  class Type019HomesController < ApplicationController
    concerning :Type019UserSessionMethods do
      included do
        helper_method :current_type019_user
      end

      def current_type019_user
        session[:type019_user].presence
      end

      def current_type019_user_required
        session.delete(:type019_user)
        authenticate_or_request_with_http_basic do |name, password|
          if name.present?
            if password == "a"
              session[:type019_user] = name.strip.encode("UTF-8")
              true
            end
          end
        end
      end
    end

    before_action :current_type019_user_required

    def show
    end
  end
end
