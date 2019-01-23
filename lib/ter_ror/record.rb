module TerRor
  class Record < SimpleDelegator
    def error_codes
      @error_codes ||= ancestor_names.map { |class_name|
        TerRor.codes.get(class_name, *error_names)
      }.compact.reduce(&:merge)
    end

    private

    def ancestor_names
      @ancestor_names ||= [].tap do |classes|
        root = defined?(ApplicationRecord) ? ApplicationRecord : ActiveRecord::Base

        klass = __getobj__.class

        loop do
          classes.unshift klass.model_name.singular
          klass = klass.superclass

          break if klass == root
        end
      end
    end

    def error_names
      @error_names ||= errors.details.map { |field, errors|
        errors.map { |error|
          "#{field}_#{error[:error]}"
        }
      }.flatten
    end
  end
end
