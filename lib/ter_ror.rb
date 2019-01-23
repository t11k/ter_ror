require "ter_ror/railtie"
require "ter_ror/config"
require "ter_ror/loader"

module TerRor
  class << self
    attr_accessor :codes, :messages
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end

  def self.load(pathname)
    Loader.call(pathname)
  end
end
