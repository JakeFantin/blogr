class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false}, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }

  # change the slug to be the id followed by the title
  def to_param
    "#{id}-#{title.parameterize}"
  end
end