require './lib/app/character'

Given /^a new character "([^"]*)"$/ do |name|
  character = Character.new
  character.name = name
  character.save
end

Given /^"([^"]*)" is level (\d+)$/ do |name, level|
  character = Character.where(name: name).first
  character.level = level
  character.save
end

Then /^"([^"]*)" should not be complete$/ do |name|
  character = Character.where(name: name).first
  character.complete.should_not == true
end

Then /^"([^"]*)" should be complete$/ do |name|
  character = Character.where(name: name).first
  character.complete.should == true
end

When /^"([^"]*)" picks the race "([^"]*)"$/ do |name, race|
  character = Character.where(name: name).first
  character.race = race
  character.save
end

When /^"([^"]*)" tags the skill "([^"]*)"$/ do |name, skill|
  character = Character.where(name: name).first
  character.tag_skill(skill)
  character.save
end

When /^"([^"]*)" takes the perk "([^"]*)"$/ do |name, perk|
  character = Character.where(name: name).first
  character.take_perk(perk)
  character.save
end