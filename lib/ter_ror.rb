require "ter_ror/railtie"
require "ter_ror/config"
require "ter_ror/loader"
require "ter_ror/helpers"
require "ter_ror/record"
require "ter_ror/serializer"

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
      Loader.call(app.root)
      Helpers.include!
    end

    def serialize(record)
      Serializer.call(record)
    end
  end
end
