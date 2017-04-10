module NameSpace1
  class Type018UsersController < ApplicationController
    include PlaggableCrud::All

    def page_header_show_title
      current_record.handle_name
    end

    def raw_current_record
      super.tap do |e|
        e.handle_name ||= "#{current_model.count.next}人目のユーザー"
        e.type018_email_activation ||= current_type018_email_activation
        if e.email.blank?
          if e.type018_email_activation
            e.email ||= e.type018_email_activation.email
          end
        end
        if e.new_record?
          e.password ||= "password"
        end
      end
    end

    def current_type018_email_activation
      if params[:activate_token].present?
        if v = Type018EmailActivation.find_by(:activate_token => params[:activate_token])
          if v.expired_at >= Time.current
            unless v.activated_at
              v
            end
          end
        end
      end
    end
  end
end
