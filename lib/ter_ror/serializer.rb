require "ter_ror/record"

module TerRor
  class Serializer
    def initialize(record)
      @record = record
    end

    def self.call(record)
      new(record).call
    end

    def call
      record.error_codes.transform_values do |code|
        {
          "code" => code,
          "message" => TerRor.messages.get(code)
        }
      end
    end

    private

    def record
      TerRor::Record.new(@record)
    end
  end
end
