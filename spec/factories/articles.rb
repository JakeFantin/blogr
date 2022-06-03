# spec/factories/articles.rb
FactoryBot.define do
  factory :article do
    title { "Title" }
    body { "This is a body" }
  end
end

