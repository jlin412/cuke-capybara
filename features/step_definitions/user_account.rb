When /^I create a new user account with email "([^"]*)", password "([^"]*)", and confirm password "([^"]*)"$/ do |email, password, confirm_password|
  find_link('Create a new user').click
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  fill_in('user_password_confirmation', :with => confirm_password)
  click_on('user_submit')
end
Given /^I update user account with email "([^"]*)", password "([^"]*)", and confirm password "([^"]*)"$/ do |email, password, confirm_password|
  find_link('Edit').click
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  fill_in('user_password_confirmation', :with => confirm_password)
  click_on('user_submit')
end