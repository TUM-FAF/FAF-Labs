require 'spec_helper'

feature 'Lecturer has a course with a subgroup' do
	let(:user)    { FactoryGirl.create(:user) }
  let!(:course) { FactoryGirl.create(:course) }	
  
	scenario 'lecturer creates an assignment' do
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

  scenario 'lecturer edits an assignment' do
    sign_in_with user
    click_link course.name
    click_link 'Create subgroup'
    fill_in 'Name', with: 'Subgroup I'
    click_button 'Save Subgroup'
    click_link 'Subgroup I'
    click_link 'New assignment'
    fill_in 'Name', with: 'assignment one'
    click_button 'Create assignment'
    page.should have_content('Edit')
    click_link 'Edit'
    page.should have_content('Name')
    page.should have_content('Save')
    fill_in 'Name', with: '(Edit)'
    click_button 'Save'
    current_path.should == subgroup_path(course)
    page.should have_content('assignment one(Edit)')    
  end
end
