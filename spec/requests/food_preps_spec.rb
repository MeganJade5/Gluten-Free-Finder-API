require 'rails_helper'

RSpec.describe "Food Preps", type: :request do
  describe "GET /food_preps" do
    # testing response

    before(:all) do
      create(:food_prep)
    end

    before(:each) do
      get "/food_preps"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "should respond with json" do
      expect(response.body).to include("Food Prep category")
    end
  end
end
