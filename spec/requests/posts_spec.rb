require 'rails_helper'

RSpec.describe "Posts", type: :request do
  # testing response
  
  before(:all) do
    create(:post)
  end
  
  describe "GET /posts/:id" do
    # valid post id

      before(:each) do
        get "/posts/1"
      end

      it "should respond with 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "should respond with included category" do
        pp response.body
        expect(response.body).to include("Australian")
      end

    # invalid post id 
    context "invalid post id" do

      before(:each) do
        get "/posts/2"
      end

      it "should respond with 404" do
        expect(response).to have_http_status(404)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "should respond with an error" do
        pp response.body
        expect(response.body).to include("Unable to find post")
      end

    end
  end

  # test have token and successful
  describe "POST / posts" do
    before(:all) do
      @post_count = Post.count
      @new_user = create(:user, email: "new@test.com")
      # not picking up category id's
      @cuisine = create(:cuisine, name: "Australian")
      @food_prep = create(:food_prep, name: "test")
    end

    context "with token" do
      before(:each) do
        token = JwtService.encode(@new_user)
        post "/posts", headers: {Authorization: "Bearer #{token}"}, params:    
          {restaurant_name: "cafe 1",
          street_number: "1",
          street_name: "road",
          suburb: "sydney",
          postcode: "2000",
          description: "info here",
          live_status: false,
          cuisine_id: @cuisine.id,
          food_prep_id: @food_prep.id}
      end
      
      it "should respond with 201 created" do
        expect(response).to have_http_status(201)
      end

      it "should increase post count by 1" do
        expect(Post.count).to eq @post_count + 1
      end

      it "should contain post content" do
        expect(response.body).to include("cafe 1")
        expect(response.body).to include("road")
        expect(response.body).to include("sydney")
      end
  end

  # without valid token and unsuccessful 
  context "without valid token" do
      before(:each) do
        token = ""

        post "/posts", headers: {Authorization: "Bearer #{token}"}, params:
          {restaurant_name: "cafe 1",
          street_number: "1",
          street_name: "road",
          suburb: "sydney",
          postcode: "2000",
          description: "info here",
          live_status: false,
          cuisine_id: @cuisine.id,
          food_prep_id: @food_prep.id}
      end
      
      it "should respond with 401 unauthorised" do
        expect(response).to have_http_status(401)
      end

      it "should not increase post count by 1" do
        expect(Post.count).to eq @post_count
      end

      it "should contain post content" do
        expect(response.body).to include("You must be logged in to do that")
      end
    end
  end
end
