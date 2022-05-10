# Preview all emails at http://localhost:3000/rails/mailers/feedback
class FeedbackPreview < ActionMailer::Preview
  def send_feedback
    FeedbackMailer.send_feedback(
      {
        author: "Mikhail Kilin",
        email: "mikhail.kilin@flatstack.com",
        message: "You are my best Padawan! :P"
      }
    )
  end
end
