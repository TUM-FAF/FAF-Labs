class SubgroupsController < ApplicationController
	def new
		@subgroup = Subgroup.new
	end

	def create
		@course = Course.find(params[:course_id])
		@subgroup = @course.subgroups.create(subgroup_params)
		redirect_to course_path(@course)
	end

private
  def subgroup_params
    params.require(:subgroup).permit!
  end
end