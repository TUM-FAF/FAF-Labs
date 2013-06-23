class CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    Course.create!(course_params)
    redirect_to dashboard_path
  end

  def show
    @course = Course.find(params[:id])
  end

  private
    def course_params
      params.require(:course).permit!
    end
end
