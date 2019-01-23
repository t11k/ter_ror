module TerRor
  class Codes
    def initialize(codes)
      @codes = codes
    end

    def get(klass, *errors)
      @codes[klass].try(:slice, *errors)
    end
  end
end
