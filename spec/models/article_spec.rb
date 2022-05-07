require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validating the article model" do
    it "is valid with valid attributes" do
      article = Article.create(title: "Title", body: "This is a body.")
      expect(article).to be_valid
    end
    it "is not valid without a title" do
      article = Article.create(body: "This is a body.")
      expect(article).to_not be_valid
    end
    it "is not valid without a body" do
      article = Article.create(title: "Title")
      expect(article).to_not be_valid
    end
    it "is not valid with short title" do
      article = Article.create(title: "Tit", body: "This is a body.")
      expect(article).to_not be_valid
    end
    it "is not valid with short body" do
      article = Article.create(title: "Title", body: "Body.")
      expect(article).to_not be_valid
    end
    it "is not valid with non-unique title" do
      article = Article.create(title: "Title", body: "This is a body.")
      article.save
      dupe_article = Article.create(title: "Title", body: "This is a body.")
      expect(dupe_article.valid?).to eq(false)
    end
  end
end
