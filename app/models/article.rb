class Article < ApplicationRecord
  scope :published, -> { where(published: true) }

  validates :title, presence: true
  validates :content, presence: true
end
