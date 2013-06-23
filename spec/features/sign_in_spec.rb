require 'spec_helper'

feature 'User signs in' do
  let(:fake_user) { stub(email: 'test@test.com', password: '123123123') }
  let(:existing_user) { FactoryGirl.create(:user) }

  scenario 'with existing credentials' do
    sign_in_with existing_user
    current_path.should == dashboard_path
  end

  scenario 'with non-existing credentials' do
    sign_in_with fake_user
    expect(page).to have_content ('Sign in')
  end
end
