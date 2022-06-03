require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
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
      get new_article_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "GET /show" do
    it "returns http status 200" do
      article = create(:article)
      get article_path(article.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "POST /create" do
    it "returns http status 200" do
      post articles_path, :params => { :article => { :title => "Title", :body => "This is a body"} }
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end

  describe "GET /edit" do
    it "returns http status 200" do
      article = create(:article)
      get edit_article_path(article.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT /update" do
    it "redirects to show on success" do
      article = create(:article)
      put article_path(article.id), :params => { :article => { :title => "Updated Title" }}
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response).to render_template(:show)
    end

    it "redirects to edit on failure" do
      article = create(:article)
      put article_path(article.id), :params => { :article => { :title => "Ti" }}
      expect(response).to have_http_status(422)
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE /destroy" do
    it "redirect to root on success" do
      article = create(:article)
      expect { delete article_path(article) }.to change { Article.count }.by(-1)
      expect(response).to have_http_status(:redirect)
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

end


