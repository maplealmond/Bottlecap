require 'spec_helper'
require 'app/dice'

describe Dice do
  
  it '#roll returns a number between 1 and 100' do
    1000.times do
      Dice.roll.should >= 1
      Dice.roll.should <= 100
    end
  end
  
  it '#fudge causes roll to return the next number' do
    10.times do
      fudge = rand(100)+1
      Dice.fudge(fudge)
      Dice.roll.should == fudge
    end
  end
  
  it '#test takes a target and returns a value' do
    skill = 60
    rolls = {0 => :legendary, 1 => :exceptional, 15 => :exceptional, 30 => :great, 45 => :good, 60 => :fair, 
             61 => :mediocre, 75 => :mediocre, 90 => :poor, 91 => :terrible, 100 => :terrible}
    
    rolls.each do |roll, outcome|
      Dice.fudge(roll)
      Dice.test(skill).should == outcome
    end
    
  end

end