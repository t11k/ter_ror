module TerRor
  class Config
    attr_accessor :codes_filepath, :messages_filepath

    def initialize
      @codes_filepath = 'config/error_codes.yml'
      @messages_filepath = 'config/error_messages.yml'
    end
  end
end
