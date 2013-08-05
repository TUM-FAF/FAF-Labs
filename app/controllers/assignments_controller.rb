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

	def update_published
		@time = Time.zone.now
		@assignment = Assignment.find(params[:id])
		if @assignment.published != true
			@assignment.update_attributes!(published: true, publish_date: @time)
		else
			@assignment.update_attributes!(published: false)
		end
		redirect_to :back
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
