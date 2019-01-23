module TerRor
  class Messages
    def initialize(messages)
      @messages = messages
    end

    def get(code)
      @messages[code]
    end
  end
end
