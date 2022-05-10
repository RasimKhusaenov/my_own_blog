class Feedback
  include ActiveModel::Model

  attr_accessor :author, :email, :message

  validates :email, :author, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
