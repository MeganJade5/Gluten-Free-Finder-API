require 'rails_helper'

RSpec.describe FoodPrep, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "factory" do
    before(:all) do
      @food_prep = build(:food_prep)
    end

    it "has a valid factory" do
      expect(@food_prep).to be_valid
    end

    it "has the right name" do
      expect(@food_prep.name).to eq "Food Prep category"
    end
    
  end
end