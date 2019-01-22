require "ter_ror/railtie"
require "ter_ror/config"

module TerRor
  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
