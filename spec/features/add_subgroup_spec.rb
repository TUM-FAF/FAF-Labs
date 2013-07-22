require 'spec_helper'

feature 'Lecturer adds a subgroup' do
	let(:user)    { FactoryGirl.create(:user) }
  let!(:course) { FactoryGirl.create(:course) }

  scenario 'the course has no subgroups' do
  	sign_in_with user
  	click_link course.name
    page.should have_content('No subgroups')
    click_button 'Create subgroup'
    current_path.should == course_path
    page.should have_content('Subgroup I')
  end

  scenario 'the course has one subgroup' do
  	sign_in_with user
  	click_link course.name
  	click_button 'Create subgroup'
    page.should have_content('Subgroup I')
    click_button 'Create subgroup'
    current_path.should == course_path
    page.should have_content('Subgroup I')
    page.should have_content('Subgroup II')
  end	

  scenario 'the course has two subgroups' do
  	sign_in_with user
  	click_link course.name
    page.should have_content('Subgroup I')
    page.should have_content('Subgroup II')
  	page.should_not have_content('Create subgroup')
  end
end