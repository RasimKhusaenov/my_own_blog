class FeedbackMailer < ApplicationMailer
  default to: "rasim.khusaenov@flatstack.dev"

  def send_feedback(feedback_params)
    @feedback = Feedback.new(feedback_params)
    mail(from: @feedback.email)
  end
end
