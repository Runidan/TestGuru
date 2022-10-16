class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      after_login(user)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'See you later!'
    redirect_to login_path
  end

  private

  def sign_out
    session.delete :user_id
    @current_user = nil
  end
end
