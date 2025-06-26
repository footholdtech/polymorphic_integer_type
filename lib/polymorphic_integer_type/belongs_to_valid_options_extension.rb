module PolymorphicIntegerType
  module BelongsToValidOptionsExtension
    def valid_options(options)
      valid = super
      valid << :integer_type if options[:polymorphic]
      valid
    end
  end
end

ActiveRecord::Associations::Builder::BelongsTo.singleton_class.prepend(PolymorphicIntegerType::BelongsToValidOptionsExtension)
