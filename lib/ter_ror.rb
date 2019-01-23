require "ter_ror/railtie"
require "ter_ror/config"
require "ter_ror/loader"
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
      self.load(app.root)
    end

    def load(pathname)
      Loader.call(pathname)
    end

    def serialize(record)
      Serializer.call(record)
    end
  end
end
