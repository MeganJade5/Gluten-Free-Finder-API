require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    # testing response

    before(:all) do
      create(:post)
    end

    before(:each) do
      get "/posts"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "should respond with included category" do
      pp response.body
      expect(response.body).to include("cuisine category")
    end

    it "should respond with description content" do
      pp response.body
      expect(response.body).to include("testing here")
    end

    it "should respond with name" do
      pp response.body
      expect(response.body).to include("post")
    end

    it "should respond with street number" do
      pp response.body
      expect(response.body).to include("1A")
    end

    it "should respond with street name" do
      pp response.body
      expect(response.body).to include("Road")
    end

    it "should respond with suburb" do
      pp response.body
      expect(response.body).to include("Sydney")
    end

    it "should respond with postcode" do
      pp response.body
      expect(response.body).to include(1)
    end

    it "should respond with live status" do
      pp response.body
      expect(response.body).to include(false)
    end
  end
end
