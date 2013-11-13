When /^I login with username "([^"]*)" and password "([^"]*)"$/ do |email, password|
  visit(ENV['APP_URL'])
  fill_in('user_session_email', :with => email)
  fill_in('user_session_password', :with => password)
  click_on('user_session_submit')
end