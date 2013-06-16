Given(/^I want to open the main page$/) do
  Course.create!(:name => "Windows Programming")
end

Given(/^I open main page$/) do
  visit '/'
end

Then /^I should see "([^"]*)"$/ do |text|
    page.should have_content(text)
end

