class Place < ActiveRecord::Base
  has_many :source_links, as: :target, inverse_of: :legacy_source, class_name: "Link"

  def self.polymorphic_name
    'Country'
  end
end
