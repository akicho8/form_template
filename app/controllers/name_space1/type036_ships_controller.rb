module NameSpace1
  class Type036ShipsController < ApplicationController
    include ModulableCrud::All

    def raw_current_records
      current_scope
    end
  end
end
