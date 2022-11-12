require 'rails_helper'

RSpec.describe User, type: :model do
  context "factory" do

    before(:all) do
      @user = build(:user)
    end

    before(:each) do
      @user = build(:user, password: "password123")
    end

    it "has a valid factory" do
      expect(@user).to be_valid
    end

    it "has the right email" do
      expect(@user.email).to eq "test@test.com"
    end
    
  end

  let "validations" do 
    before(:each) do
      @user = build(@user)
    end

    it "is invalid without an email"
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do 
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password confirmation" do 
      user = build(:user, password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password and password confirmation don't match" do 
      user = build(:user, password_confirmation: "password2")
      expect(user).to_not be_valid
    end
  end
