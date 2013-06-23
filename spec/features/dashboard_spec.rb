require 'spec_helper'

feature 'Going to the dashboard' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'the user can add courses' do
    sign_in_with user
    click_link "Add course"
    current_path.should == new_course_path

    fill_in 'Name',        with: 'Testing'
    fill_in 'Summary',     with: 'Blablabla, we test'
    fill_in 'Description', with: 'Moar testing'
    click_button 'Save'

    current_path.should == dashboard_path
    page.should have_link('Testing')
    page.should have_content('Blablabla, we test')
    page.should_not have_content('Moar testing')
  end
end
