require 'spec_helper'
require 'app/character'

describe Character do
  before (:each) do
    @character = Character.new(name: "Test")
  end
  
  it "has a name" do
    @character.name.should == "Test"
  end
    
  it "has SPECIAL stats" do
    @character.st = 10
    @character.pe = 11
    @character.en = 12
    @character.ch = 13
    @character.in = 14
    @character.ag = 15
    @character.lk = 16

    @character.st.should == 10
    @character.pe.should == 11
    @character.en.should == 12
    @character.ch.should == 13
    @character.in.should == 14
    @character.ag.should == 15
    @character.lk.should == 16    
  end
  
  it "defines #max_hp based on level and con" do
    1.upto(10) do |l|
      1.upto(10) do |e|
        @character.level = l
        @character.en = e
        @character.max_hp.should == (95 + (@character.en * 20) + (@character.level * 5))
      end
    end
  end
    
  it "takes #damage when attacked" do
    @character.level = 5
    @character.en = 5
    expect { @character.damage(10) }.to change(@character, :hp).by(-10)
  end
  
  it "defines #max_ap based on agility" do
    1.upto(10) do |a|
      @character.ag = a
      @character.max_ap.should == (10 + @character.ag)
    end
  end
  
  it "defines #sequence based on perception and agility" do
    1.upto(10) do |a|
      1.upto(10) do |p|
        @character.ag = a
        @character.pe = p
        @character.sequence.should == (a + p)
      end
    end
  end
        
end