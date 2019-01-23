module TerRor
  module Model
    extend ActiveSupport::Concern

    included do
      class_attribute :error_modifiers

      delegate :error_modifiers, to: :class
    end

    class_methods do
      def on_error(name, &block)
        self.error_modifiers ||= {}
        error_modifiers[name.to_s] = block
      end
    end

    def terrors
      TerRor.serialize(self).map do |name, definition|
        if error_modifiers&.has_key?(name)
          instance_exec(definition, &error_modifiers[name])
        end

        definition
      end
    end
  end
end
