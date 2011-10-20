require 'spec_helper'
require 'app/game'
require 'app/character'
require 'app/controller'


describe Game do
  before (:all) do
    @game = Game.new
  end
  
  it "has a name" do
    @game.name = "Test"
    @game.name.should == "Test"
  end  
  
  it "defines a hash of skills" do
    @game.skills[:athletics].should == :strength
  end
  
  it "has a set of characters" do
    @game.characters << Character.new(name: "Alex")
    @game.characters << Character.new(name: "Bob")
  end
  
end