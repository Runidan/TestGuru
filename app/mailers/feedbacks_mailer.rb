class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback, to_email)
    @feedback = feedback
    mail to: to_email, subject: 'Feedback from site'
  end
end
