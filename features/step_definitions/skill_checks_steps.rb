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
  character = Character.find(name: name).first
  skill = character.skills.find_or_create_by(name: skill).first
  skill.value = value
  skill.save
end
