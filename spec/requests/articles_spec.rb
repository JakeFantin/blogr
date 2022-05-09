require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/articles"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
    # TODO Build 404 page to redirect to;
    # it "returns http failure" do
    #   expect {
    #     get "/rarticles"
    #   }.to raise_error ActionController::RoutingError
    # end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/articles/new"
      expect(response).to have_http_status(:success)
    end
  end

end
