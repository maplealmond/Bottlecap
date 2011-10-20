require './lib/app/controller'

Given /^a connection$/ do
  @controller = Controller.new
  @output = []
end

When /^I type "([^"]*)"$/ do |text|
  @output << @controller.parse(text)
end

Then /^I should see "([^"]*)"$/ do |text|
  @output.include?(text).should == true
end

Then /^I should not see "([^"]*)"$/ do |text|
  @output.include?(text).should == false
end