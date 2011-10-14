require 'spec_helper'
require 'app/game'

describe Game do
  before (:each) do
    @game = Game.new
  end
  
  it "has a name" do
    @game.name = "Test"
    @game.name.should == "Test"
  end
  
  context "character advancement" do
    it "#character_create"
    it "#character_create"
  end
  
  context "combat" do
    it "starts initiative"
    it "ends initiative"
    it "cycles turns"
    it "lets one character hurt another with a basic attack"
  end
  
end