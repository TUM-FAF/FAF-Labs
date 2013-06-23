class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboard = DashboardPresenter.new(current_user)
  end
end
