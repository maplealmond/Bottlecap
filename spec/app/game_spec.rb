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
  
end