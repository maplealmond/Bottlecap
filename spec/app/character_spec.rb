require 'spec_helper'
require 'app/character'

describe Character do
  before (:each) do
    @character = Character.new(name: "Test")
  end
  
  it "has a name" do
    @character.name.should == "Test"
  end
    
  context "SPECIAL stats" do
    
    before(:each) do
      @character.strength = 3
      @character.perception = 4
      @character.endurance = 5
      @character.charisma = 6
      @character.intelligence = 7
      @character.agility = 8
      @character.luck = 9
    end

    it "has readable stats" do
      @character.strength.should == 3
      @character.perception.should == 4
      @character.endurance.should == 5
      @character.charisma.should == 6
      @character.intelligence.should == 7
      @character.agility.should == 8
      @character.luck.should == 9    
    end
    
    it "has a readable total" do
      @character.stat_total.should == 42
    end
    
  end
    
  it "defines #max_hp based on level and con" do
    1.upto(10) do |l|
      1.upto(10) do |e|
        @character.level = l
        @character.endurance = e
        @character.max_hp.should == (95 + (@character.endurance * 20) + (@character.level * 5))
      end
    end
  end
    
  it "takes #damage when attacked" do
    @character.level = 5
    @character.endurance = 5
    expect { @character.damage(10) }.to change(@character, :hp).by(-10)
  end
  
  it "defines #max_ap based on agility" do
    1.upto(10) do |a|
      @character.agility = a
      @character.max_ap.should == (10 + @character.agility)
    end
  end
  
  it "defines #sequence based on perception and agility" do
    1.upto(10) do |a|
      1.upto(10) do |p|
        @character.agility = a
        @character.perception = p
        @character.sequence.should == (a + p)
      end
    end
  end
          
end