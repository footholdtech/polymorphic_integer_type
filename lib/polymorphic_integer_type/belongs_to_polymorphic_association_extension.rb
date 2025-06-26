module PolymorphicIntegerType
  module BelongsToPolymorphicAssociationExtension
    private

    if Gem::Version.new(ActiveRecord::VERSION::STRING) < Gem::Version.new("6.1")
      def replace_keys(record)
        super

        if reflection.options[:integer_type] || reflection.options[:polymorphic].is_a?(Hash)
          owner[reflection.foreign_type] = record.class.base_class unless record.nil?
        end
      end
    else
      def replace_keys(record, force: false)
        super

        if reflection.options[:integer_type] || reflection.options[:polymorphic].is_a?(Hash)
          owner[reflection.foreign_type] = record.class.base_class unless record.nil?
        end
      end
    end
  end
end

ActiveRecord::Associations::BelongsToPolymorphicAssociation.prepend(PolymorphicIntegerType::BelongsToPolymorphicAssociationExtension)
