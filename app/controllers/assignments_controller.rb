class AssignmentsController < ApplicationController
	def new
		@subgroup = Subgroup.find(params[:subgroup_id])
		@assignment = Assignment.new
	end

	def create
		@subgroup = Subgroup.find(params[:subgroup_id])
		@assignment = @subgroup.assignments.create(assignment_params)
		redirect_to subgroup_path(@subgroup)
	end

	def edit
		@assignment = Assignment.find(params[:id])
	end

	def update
		@subgroup = Subgroup.find(params[:subgroup_id])
		@assignment = Assignment.find(params[:id])
		if @assignment.update(assignment_params)
			redirect_to @subgroup
		else 
			render 'edit'
		end
	end

	private
  def assignment_params
    params.require(:assignment).permit!
  end
end
