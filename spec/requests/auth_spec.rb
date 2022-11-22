require 'rails_helper'

RSpec.describe "Auths", type: :request do
  describe "POST /auth/signin" do
    before(:all)do
      @user = create(:user)
    end

    context "with correct credentials" do
      before(:each) do
        get "/auth/signin", params: {email: "test@test.com", password: "password123"}
      end

      it "should return 200 ok" do
        pp request
        expect(response).to have_http_status(200)
      end

      it "should include a jwt" do
        expect(response.body).to include("jwt")
      end

      # incorrect credentials
      context "with incorrect credentials" do
        before(:each) do
          get "/auth/signin", params: {email: "test@test.com", password: "wrongpassword"}
        end

        it "should return 422" do
          pp request
          expect(response).to have_http_status(422)
        end

        it "should include an error message" do
          expect(response.body).to include("Incorrect email or password")
        end
      end
    end
  end

  describe "POST /auth/signup" do
    context "with valid details" do
      before(:all) do
        @user_count = User.count
      end

      before(:each) do
        post "/auth/signup", params: {email: "test2@test.com", password: "password", password_confirmation: "password"}
      end

      it "should return 201 created" do
        expect(response).to have_http_status(201)
      end

      it "should include a jwt" do
        expect(response.body).to include("jwt")
      end

      it "should increase user count" do
        expect(User.count).to eq(@user_count + 1)
      end
    end
  end
end
