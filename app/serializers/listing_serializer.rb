class ListingSerializer < ActiveModel::Serializer
  attributes :id, :discriminatory, :num_listings, :num_discriminatory
end
