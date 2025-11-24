class PagesController < ApplicationController
  def home
    # Landing page - no data needed yet
  end

  def about
  end

  def privacy
  end

  def feedback
  end

  def submit_feedback
    submitter_email = current_user&.email
    submitter_type = current_user ? "User" : "Guest"

    FeedbackMailer.feedback_submission(
      feedback_params,
      submitter_email,
      submitter_type
    ).deliver_now

    redirect_to thank_you_path
  end

  def thank_you
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message, categories: [])
  end
end
