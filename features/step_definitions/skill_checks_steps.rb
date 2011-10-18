require './lib/app/dice'

Given /^an average character "([^"]*)"$/ do |name|
  game = Game.find_or_create_by(name: "Wasteland")
  character = Character.new(name: name)
  
  character.strength = 5
  character.perception = 5
  character.endurance = 5
  character.charisma = 5
  character.intelligence = 5
  character.agility = 5  
  character.luck = 5
  
  game.characters << character
  character.save
  game.save
end

Given /^"([^"]*)" has (\d+) points in "([^"]*)"$/ do |name, value, skill|
  character = Character.where(name: name).first
  skill = character.skills.find_or_create_by(name: skill)
  skill.value = value
  skill.save
end

Given /^the next roll is a (\d+)$/ do |roll|
  Dice.fudge(roll)
end

Then /^"([^"]*)" has an effective "([^"]*)" skill of (\d+)$/ do |name, skill, value|
  character = Character.where(name: name).first
  character.skill(skill).should == value
end

Then /^when "([^"]*)" rolls "([^"]*)" he scores "([^"]*)"$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

