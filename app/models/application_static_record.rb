module ApplicationStaticRecord
  extend ActiveSupport::Concern

  included do
    include StaticRecord
  end
end
