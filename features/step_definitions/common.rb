Given /^I go to home website$/ do
  visit(ENV['APP_URL'])
end

Then /^I shall see "([^"]*)"$/ do |text|
  page.should have_content(text)
end


When /^I follow "([^"]*)"$/ do |text|
  click_on(text)
end
Then /^I shall not see "([^"]*)"$/ do |arg|
  page.should_not have_content(text)
end