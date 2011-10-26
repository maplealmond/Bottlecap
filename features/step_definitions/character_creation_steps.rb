require './lib/app/character'
require './lib/app/game'

Given /^a new character "([^"]*)"$/ do |name|
  @controller ||= Controller.new
  game = @controller.game ||= Game.new(name: "Wasteland")
  character = @controller.characters[name] = Character.new(name: name)
  game.characters << character
end

Given /^"([^"]*)" is level (\d+)$/ do |name, level|
  character = @controller.characters[name]
  character.level = level.to_i
end

Then /^"([^"]*)" should be level (\d+)$/ do |name, level|
  character = @controller.characters[name]
  character.level.should == level.to_i
end

Then /^"([^"]*)" should not be complete$/ do |name|
  character = @controller.characters[name]
  character.complete.should_not == true
end

Then /^"([^"]*)" should have nothing to do$/ do |name|
  character = @controller.characters[name]  
  character.todo.should == nil
end

Then /^"([^"]*)" should be complete$/ do |name|
  character = @controller.characters[name]
  character.complete.should == true
end

When /^"([^"]*)" picks the race "([^"]*)"$/ do |name, race|
  character = @controller.characters[name]
  character.race = race
end

When /^"([^"]*)" selects starting stats$/ do |name|
  character = @controller.characters[name]
  character.strength = 7
  character.perception = 7
  character.endurance = 6
  character.charisma = 5
  character.intelligence = 5
  character.agility = 5  
  character.luck = 5
end

When /^"([^"]*)" tags the skill "([^"]*)"$/ do |name, skill|
  character = @controller.characters[name]
  character.tag_skill(skill)
end

When /^"([^"]*)" takes the perk "([^"]*)"$/ do |name, perk|
  character = @controller.characters[name]
  character.take_perk(perk)
end

When /^"([^"]*)" gains (\d+) XP$/ do |name, xp|
  character = @controller.characters[name]
  character.add_xp(xp.to_i)
end