When /^"([^"]*)" has not tagged "([^"]*)"$/ do |name, skill|
  character = Character.where(:name => name).first
  character.untag_skill(skill)
  character.save
end

When /^"([^"]*)" has tagged "([^"]*)"$/ do |name, skill|
  character = Character.where(:name => name).first
  character.tag_skill(skill)
  character.save
end

When /^"([^"]*)" has practiced "([^"]*)" (\d+) times$/ do |name, skill, n|
  character = Character.where(:name => name).first
  
  n.to_i.times do
    character.practice_skill(skill)
    character.advance_skills
  end
  
  character.save
end
