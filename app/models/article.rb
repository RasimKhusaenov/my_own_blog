class Article < ApplicationRecord
  scope :published, -> { where(published: true) }

  belongs_to :company, optional: true
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def draft?
    !published?
  end
end
