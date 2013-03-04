Given(/^I am on the main page$/) do
  visit '/'
end

Given(/^there are courses$/) do
  Course.create!(:name => "Windows Programming")
end

Then(/^I should see the list of courses$/) do
  page.has_content?("Windows Programming")
end
