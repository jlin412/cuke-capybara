When /^I create a pending order with pizza name "([^"]*)" with size "([^"]*)"$/ do |name, size|
  fill_in('pizza_name', :with => name)
  fill_in('pizza_size', :with => size)
  click_on('pizza_submit')
end

# Validate only the last order
Then /^last pizza order is not placed yet$/ do
  find('//table/tbody/tr[last()]/td[4]').text.should == "false"
end

Then /^last pizza order is placed$/ do
  find('//table/tbody/tr[last()]/td[4]').text.should == "true"
end

Then /^last pizza order is with pizza name "([^"]*)" with size "([^"]*)"$/ do |name, size|
  find('//table/tbody/tr[last()]/td[1]').text.should == name
  find('//table/tbody/tr[last()]/td[2]').text.should == size
end

When /^I update last order with pizza name "([^"]*)" with size "([^"]*)"$/ do |name, size|
  find('//table/tbody/tr[last()]/td[6]/a').click   # click edit link

  fill_in('pizza_name', :with => name)
  fill_in('pizza_size', :with => size)
  click_on('pizza_submit')
end
When /^I remove last order$/ do
  find('//table/tbody/tr[last()]/td[7]/a').click   # click edit link
end

When /^I add a new topping name "([^"]*)" with double order$/ do |name|
  click_on('Add toppings')
  fill_in('topping_name', :with => name)
  check('topping_double_order')
  click_on('topping_submit')
end

When /^I add a new topping name "([^"]*)" without double order$/ do |name|
  click_on('Add toppings')
  fill_in('topping_name', :with => name)
  click_on('topping_submit')
end

When /^I remove last topping$/ do
  find('//table/tbody/tr[last()]/td[3]/a').click
end
When /^last topping is without double order$/ do
  find('//table/tbody/tr[last()]/td[2]').text.should == 'false'
end

When /^last topping is with double order$/ do
  find('//table/tbody/tr[last()]/td[2]').text.should == 'true'
end
When /^number of toppings in last order is "([^"]*)"$/ do |num|
  find('//table/tbody/tr[last()]/td[3]').text.should == num
end
When /^I display last pizza order detail$/ do
  find('//table/tbody/tr[last()]/td[5]/a').click

end
When /^I go to edit page of detail order$/ do
  visit('/edit')
end