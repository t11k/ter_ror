require "ter_ror/railtie"
require "ter_ror/config"
require "ter_ror/loader"
require "ter_ror/record"
require "ter_ror/serializer"
require "ter_ror/model"

module TerRor
  class << self
    attr_accessor :codes, :messages

    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end

    def init(app)
      self.load(app.root)

      ApplicationRecord.include(TerRor::Model)
    end

    def load(pathname)
      Loader.call(pathname)
    end

    def serialize(record)
      Serializer.call(record)
    end
  end
end
