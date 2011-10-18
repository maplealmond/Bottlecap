require './lib/app/character'
require './lib/app/game'

Given /^a new character "([^"]*)"$/ do |name|
  game = Game.find_or_create_by(name: "Wasteland")
  character = Character.new(name: name)
  
  game.characters << character
  character.save
  game.save
end

Given /^"([^"]*)" is level (\d+)$/ do |name, level|
  character = Character.where(name: name).first
  character.level = level.to_i
  character.save
end

Then /^"([^"]*)" should be level (\d+)$/ do |name, level|
  character = Character.where(name: name).first
  character.level.should == level.to_i
end

Then /^"([^"]*)" should not be complete$/ do |name|
  character = Character.where(name: name).first
  character.complete.should_not == true
end

Then /^"([^"]*)" should have nothing to do$/ do |name|
  character = Character.where(name: name).first  
  character.todo.should == nil
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

When /^"([^"]*)" selects starting stats$/ do |name|
  character = Character.where(name: name).first
  character.strength = 7
  character.perception = 7
  character.endurance = 6
  character.charisma = 5
  character.intelligence = 5
  character.agility = 5  
  character.luck = 5
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

When /^"([^"]*)" gains (\d+) XP$/ do |name, xp|
  character = Character.where(name: name).first
  character.add_xp(xp.to_i)
  character.save
end