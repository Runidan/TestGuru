class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback, to_email)
    @feedback = feedback
    mail to: 'sdfslkj@lsdkfj.ru', subject: 'Feedback from site'
  end
end
