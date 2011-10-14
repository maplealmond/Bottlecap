require 'spec_helper'
require 'app/character'

describe Character do

  before (:all) do
    Character.destroy_all
  end
  
  before (:each) do
    @character = Character.new(name: "Test")
  end
  
  it "has a name" do
    @character.name.should == "Test"
  end
  
  it "can be persisted" do
    @character.save
    Character.where(name: "Test").first.name.should == "Test"
  end
  
  it "has special stats" do
    @character.strength     = 10
    @character.perception   = 11
    @character.endurance    = 12
    @character.charisma     = 13
    @character.intelligence = 14
    @character.agility      = 15
    @character.luck         = 16

    @character.strength.should     == 10
    @character.perception.should   == 11
    @character.endurance.should    == 12
    @character.charisma.should     == 13
    @character.intelligence.should == 14
    @character.agility.should      == 15
    @character.luck.should         == 16    
  end
  
  it "#max_hp based on level and con" do
    1.upto(10) do |l|
      1.upto(10) do |e|
        @character.level = l
        @character.endurance = e
        @character.max_hp.should == (95 + (@character.endurance * 20) + (@character.level * 5))
      end
    end
  end
    
  it "takes damage when attacked" do
    @character.level = 5
    @character.endurance = 5
    expect { @character.damage(10) }.to change(@character, :hp).by(-10)
  end
  
  it "#max_ap based on agi" do
    1.upto(10) do |a|
      @character.agility = a
      @character.max_ap.should == (10 + @character.agility)
    end
  end
        
end