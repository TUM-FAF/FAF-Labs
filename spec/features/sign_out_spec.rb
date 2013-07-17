require 'spec_helper'

feature 'User signs out' do
	let(:existing_user) { FactoryGirl.create(:user) }

	scenario 'when the user is signed in' do
		sign_in_with existing_user
		visit(dashboard_path)
		click_button('Sign out')
		expect(page).to have_content('Sign in')
	end

	scenario 'when the user is signed out' do
		sign_in_with existing_user
		visit(dashboard_path)
		click_button('Sign out')
		page.should_not have_content('Sign out')
	end
end