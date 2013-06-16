Given(/^I am an existing user$/) do
  @user = User.create(email: 'user@example.com', password: 'testuser')
end

Given(/^I have signed in$/) do
  visit '/'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
end

Then(/^I should be on the dashboard$/) do
  page.should have_content 'Dashboard'
end

