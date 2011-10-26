When /^"([^"]*)" has not tagged "([^"]*)"$/ do |name, skill|
  character = @controller.characters[name]
  character.untag_skill(skill)
end

When /^"([^"]*)" has tagged "([^"]*)"$/ do |name, skill|
  character = @controller.characters[name]
  character.tag_skill(skill)
end

When /^"([^"]*)" has practiced "([^"]*)" (\d+) times$/ do |name, skill, n|
  character = @controller.characters[name]  
  n.to_i.times do
    character.practice_skill(skill)
    character.advance_skills
  end
end
