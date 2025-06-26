class AddLegacySourceReferenceToLinksTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :links, :legacy_source, polymorphic: true
  end
end


