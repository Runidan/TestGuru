# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[feedback]

  def feedback
    @email = current_user&.email
    render template: 'pages/feedback'
  end

  def send_feedback
    @feedback = feedback_params
    User.where("type='Admin'").find_each do |user|
      FeedbacksMailer.send_feedback(@feedback, user.email).deliver_now
    end
    redirect_to root_path, notice: 'Отзыв успешно отправлен'
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  private

  def feedback_params
    params.permit(:text, :email)
  end
end
