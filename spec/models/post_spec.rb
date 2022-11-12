require 'rails_helper'

RSpec.describe Post, type: :model do
  # with shoulda-matcher gem

  context "associations" do 
    it {should belong_to(:user)}
    it {should belong_to(:cuisine)}
    it {should belong_to(:food_prep)}
  end

  context "validations" do
    it {should validate_presence_of(:restaurant_name)}
    it {should validate_presence_of(:street_number)}
    it {should validate_presence_of(:street_name)}
    it {should validate_presence_of(:suburb)}
    it {should validate_presence_of(:postcode)}
    it {should validate_presence_of(:description)}
  end
end
