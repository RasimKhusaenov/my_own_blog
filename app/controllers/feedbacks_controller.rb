class FeedbacksController < ApplicationController
  expose :feedback

  def new; end

  def create
    FeedbackMailer.send_feedback(feedback_params).deliver_later if feedback.valid?
    respond_with feedback, location: root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:author, :email, :message)
  end
end
