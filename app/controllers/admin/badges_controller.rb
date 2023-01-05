# frozen_string_literal: true


class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: :destroy

  def index
    @badges = Badge.all
  end

  def create
    @badge = Question.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :index
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:badge_type, :option)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
