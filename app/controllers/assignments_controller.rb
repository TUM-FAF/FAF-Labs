class AssignmentsController < ApplicationController
	def new
		@assignment = Assignment.new
	end

	def create
		@subgroup = Subgroup.find(params[:subgroup_id])
		@assignment = @subgroup.assignments.create(assignment_params)
		redirect_to subgroup_path(@subgroup)
	end

	private
  def assignment_params
    params.require(:assignment).permit!
  end
end
