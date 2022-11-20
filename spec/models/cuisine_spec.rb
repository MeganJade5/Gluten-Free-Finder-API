require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "factory" do
    before(:all) do
      @cuisine = build(:cuisine)
    end

    it "has a valid factory" do
      expect(@cuisine).to be_valid
    end

    it "has the right name" do
      expect(@cuisine.name).to eq "Australian"
    end
    
  end
end
