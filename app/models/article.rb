class Article < ApplicationRecord
  scope :published, -> { where(published: true) }

  has_many :comments, dependent: :destroy

  belongs_to :company, optional: true
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def draft?
    !published?
  end
end
