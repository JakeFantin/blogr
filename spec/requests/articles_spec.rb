require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/articles"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /article/:id" do
    it "returns http success" do
      get "/article/1"
      expect(response).to have_http_status(:success)
    end
  end

end
