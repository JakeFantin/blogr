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
    it "returns http status 200" do
      get "/articles/new"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "GET /show" do
    it "returns http status 200" do
      article = Article.new(title: "Title", body: "This is a body.")
      article.save();
      get "/articles/#{article.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "POST /create" do
    it "returns http status 200" do
      post "/articles", :params => { :article => { :title => "Title", :body => "This is a body"} }
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end

  describe "GET /edit" do
    it "returns http status 200" do
      article = Article.new(title: "Title", body: "This is a body.")
      article.save();
      get "/articles/#{article.id}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT /update" do
    it "redirects to show on success" do
      article = Article.new(title: "Title", body: "This is a body.")
      article.save();
      put "/articles/#{article.id}", :params => { :article => { :title => "Updated Title" }}
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response).to render_template(:show)
    end

    it "redirects to edit on failure" do
      article = Article.new(title: "Title", body: "This is a body.")
      article.save();
      put "/articles/#{article.id}", :params => { :article => { :title => "Ti" }}
      expect(response).to render_template(:edit)
    end
  end

end


