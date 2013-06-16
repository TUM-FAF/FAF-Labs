class DashboardController < ApplicationController
  def index
    @dashboard = DashboardPresenter.new(current_user)
  end
end
