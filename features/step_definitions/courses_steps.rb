Given(/^I want to open the main page$/) do
  Course.create!(:name => "Windows Programming")
end

Given(/^I open main page$/) do
  visit '/'
end

Then(/^I should see the list of courses$/) do
  assert page.has_content?("Windows Programming"), page.html
end
