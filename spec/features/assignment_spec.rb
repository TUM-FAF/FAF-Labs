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
    current_path.should == new_subgroup_assignment_path(course.subgroups.first)
    fill_in 'Name', with: 'assignment one'
    click_button 'Create assignment'
    current_path.should == subgroup_path(course)
    page.should have_content('assignment one')
  end
end
