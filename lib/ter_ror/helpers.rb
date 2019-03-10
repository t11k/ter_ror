require "ter_ror/model"
require "ter_ror/controller"

module TerRor
  module Helpers
    def self.include!
      ApplicationRecord.include(TerRor::Model)
      ApplicationController.include(TerRor::Controller)
    end
  end
end
