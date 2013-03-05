Given(/^I am on the main page$/) do
  visit '/'
end

Given(/^there are courses$/) do
  course = Course.create!
end

Then(/^I should see the list of courses$/) do
  assert page.has_content?("Windows Programming")
end
