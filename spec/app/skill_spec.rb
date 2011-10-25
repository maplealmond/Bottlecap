require 'spec_helper'
require 'app/character'

describe Skill do
  before (:each) do
    @character = Character.new(name: "Joe", level: 30)
    @skill = Skill.new(name: "Test")
    @character.skills << @skill
  end
  
  it "increases advancement on practiced skills" do
    @skill.advancement = 0
    @skill.value = 50
    @skill.practice = true
    @skill.advance
    @skill.advancement.should == 1
  end
  
end
