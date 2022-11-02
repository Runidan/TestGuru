# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :admin_required!

    def admin_required!
      redirect_to root_path, alert: 'You are not autorized to view this page.' unless current_user.is_a?(Admin)
    end
  end
end