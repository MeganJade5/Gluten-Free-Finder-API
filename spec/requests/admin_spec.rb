require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /posts" do
    it "returns http success" do
      get "/admin/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show_post" do
    it "returns http success" do
      get "/admin/show_post"
      expect(response).to have_http_status(:success)
    end
  end

end
