require "ter_ror/codes"
require "ter_ror/messages"

module TerRor
  class Loader
    def initialize(pathname)
      @pathname = pathname
    end

    def self.call(pathname)
      new(pathname).call
    end

    def call
      TerRor.codes = codes
      TerRor.messages = messages
    end

    private

    def codes
      Codes.new(loaded(codes_filepath))
    end

    def messages
      Messages.new(loaded(messages_filepath))
    end

    def loaded(path)
      YAML.load_file(path)
    end

    def codes_filepath
      @pathname.join(TerRor.config.codes_filepath)
    end

    def messages_filepath
      @pathname.join(TerRor.config.messages_filepath)
    end
  end
end
