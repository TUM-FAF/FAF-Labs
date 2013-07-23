require 'spec_helper'

feature 'User signs out' do
	let(:existing_user) { FactoryGirl.create(:user) }

	scenario 'when the user is signed in' do
		sign_in_with existing_user
		visit(dashboard_path)
		click_link('Sign out')
		current_path.should == root_path
	end

	scenario 'when the user is signed out' do
		sign_in_with existing_user
		visit(dashboard_path)
		click_link('Sign out')
		page.should_not have_content('Sign out')
	end
end