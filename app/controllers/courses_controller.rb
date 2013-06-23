class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    Course.create!(course_params)
    redirect_to dashboard_path
  end

  private
    def course_params
      params.require(:course).permit!
    end
end
