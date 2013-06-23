require 'spec_helper'

feature 'Going to the dashboard' do
  let(:user)    { FactoryGirl.create(:user) }
  let!(:course) { FactoryGirl.create(:course) }

  scenario 'the user can add courses' do
    sign_in_with user
    click_link "Add course"
    current_path.should == new_course_path

    fill_in 'Course name', with: 'Testing'
    fill_in 'Summary',     with: 'Blablabla, we test'
    fill_in 'Syllabus',    with: 'Moar testing'
    click_button 'Save Course'

    current_path.should == dashboard_path
    page.should have_link('Testing')
    page.should have_content('Blablabla, we test')
    page.should_not have_content('Moar testing')
  end

  scenario 'the user can view a course' do
    sign_in_with user
    click_link course.name
    page.should have_content(course.summary)
    page.should have_content(course.syllabus)
  end

end
