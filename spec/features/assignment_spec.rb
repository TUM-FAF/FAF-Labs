require 'spec_helper'

feature 'Lecturer creates an assignment' do
	let(:user)    { FactoryGirl.create(:user) }
  let!(:course) { FactoryGirl.create(:course) }	
  

	scenario 'the lecturer has a course and subgroup' do
		sign_in_with user
  	click_link course.name
  	click_link 'Create subgroup'
    current_path.should == new_course_subgroup_path(course)
    fill_in 'Name', with: 'Subgroup I'
    click_button 'Save Subgroup'
    click_link 'Subgroup I'
    current_path.should == course_subgroup_path(course, course.subgroups.first)
    click_link 'New assignment'
    current_path.should == new_subgroup_assignment(course.subgroups)
    fill_in 'name', with: 'assignment one'
    click_link 'Create assignment'
    current_path.should == course_subgroup_path(course)
    page.should have.content == 'assignment one'
  end
end