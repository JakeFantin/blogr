require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validating the article model" do
    it "is valid with valid attributes" do
      article = build(:article)
      expect(article).to be_valid
    end
    it "is not valid without a title" do
      article = build(:article, title: nil)
      expect(article).to_not be_valid
    end
    it "is not valid without a body" do
      article = build(:article, body: nil)
      expect(article).to_not be_valid
    end
    it "is not valid with short title" do
      article = build(:article, title: 'Tit')
      expect(article).to_not be_valid
    end
    it "is not valid with short body" do
      article = build(:article, body: 'Body')
      expect(article).to_not be_valid
    end
    it "is not valid with non-unique title" do
      article = create(:article)
      dupe_article = build(:article)

      expect(dupe_article.valid?).to eq(false)
    end
  end
end
