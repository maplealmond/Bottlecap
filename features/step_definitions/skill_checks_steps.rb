require './lib/app/dice'

Given /^an average character "([^"]*)"$/ do |name|
  @controller ||= Controller.new
  game = (@controller.game ||= Game.new(name: "Wasteland"))
  character = Character.new(name: name)
  
  game.characters << character
  
  @controller.game.should == game
    
  character.strength = 5
  character.perception = 5
  character.endurance = 5
  character.charisma = 5
  character.intelligence = 5
  character.agility = 5  
  character.luck = 5
end

Given /^"([^"]*)" has (\d+) points in "([^"]*)"$/ do |name, value, skill|
  character = @controller.characters.named(name)
  character.skills.named(skill).value = value
end

Given /^the next roll is a (\d+)$/ do |roll|
  Dice.fudge(roll)
end

Then /^"([^"]*)" has an effective "([^"]*)" skill of (\d+)$/ do |name, skill, value|
  character = @controller.characters.named(name)
  character.skills.named(skill).effective_value.should == value.to_i
end

Then /^when "([^"]*)" tests "([^"]*)" he scores "([^"]*)"$/ do |name, skill, outcome|
  character = @controller.characters.named(name)
  character.test(skill).should == outcome.to_sym
end

