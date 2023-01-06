# frozen_string_literal: true


class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: :destroy

  def index
    @badges = Badge.all
    @badge_category = Badge.new(badge_type: "for_all_in_category")
    @badge_first_try = Badge.new(badge_type: "on_the_first_try")
    @badge_level = Badge.new(badge_type: "all_test_one_level")
    @badges_array = [@badge_category, @badge_first_try, @badge_level]
  end

  def create
    @badge = Badge.new(badge_params)
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
    params.require(:badge).permit(:badge_type, :option, :image)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
