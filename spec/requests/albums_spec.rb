require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "GET /albums" do
    before(:each) do
      get '/albums'
    end

      it "should respond with 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

   describe "GET /albums/:id" do

    before(:all) do
      create(:album)
    end

    context "when going to a valid id" do
      before(:each) do
        build(:album)
        get "/albums/1"
      end

      it "should respond with 200 ok" do
        expect(response).to have_http_status(200)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

    end

    context "when going to an invalid id" do
      before(:each) do
        get "/albums/100"
      end
      it "should respond with a 404 error" do
        expect(response).to have_http_status(404)
      end

      it "should respond with a 'Page not found' " do
        expect(response.body).to include("Page not found")
      end
    end
  end
end
