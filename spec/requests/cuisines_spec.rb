require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /cuisines" do
    # testing response

    before(:all) do
      create(:cuisine)
    end

    before(:each) do
      get "/cuisines"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "should respond with json" do
      expect(response.body).to include("cuisine category")
    end
  end
end
