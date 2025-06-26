class Link < ActiveRecord::Base
  include PolymorphicIntegerType::Extensions

  def self.polymorphic_class_for(name)
    name == 'Country' ? Place : super
  end

  belongs_to :source, polymorphic: true, integer_type: true
  belongs_to :target, polymorphic: true, integer_type: true

  belongs_to :legacy_source, polymorphic: true
end
