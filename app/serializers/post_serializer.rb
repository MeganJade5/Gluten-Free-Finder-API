class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :restaurant_name, :street_number, :street_name, :suburb, :postcode, :description, :cuisine_id, :food_prep_id, :live_status, :image, :image_url
end
