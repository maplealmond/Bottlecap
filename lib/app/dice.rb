#TODOO: Make this unique per game, not per world

class Dice
  
  GRADES = [:terrible,:poor,:mediocre,:fair,:good,:great,:exceptional,:legendary]
  @@fudge = nil
  
  def self.roll
    if @@fudge
      fudge = @@fudge
      @@fudge = nil
      fudge
    else
      rand(100) + 1
    end
  end
  
  def self.test(target)    
    delta = (target.to_i - roll)
    index = (delta + 45) / 15
    index = [index,0].max
    index = [index,7].min
    GRADES[index]
  end
  
  def self.fudge(value)
    @@fudge = value.to_i
  end
  
end