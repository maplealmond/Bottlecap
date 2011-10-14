class Character
  include Mongoid::Document
  
  #Basic Info
  field :name, type: String
  index :name, unique: true
  
  field :race, type: String
  field :level, type: Integer  
  
  #Core Stats
  field :strength,     type: Integer
  field :perception,   type: Integer
  field :endurance,    type: Integer
  field :charisma,     type: Integer
  field :intelligence, type: Integer
  field :agility,      type: Integer
  field :luck,         type: Integer
  
  #Skills
  field :tagged,       type: Array
  
  #Potential problems
  field :damage, type: Integer
  field :rads, type: Integer
  field :food, type: Integer
  field :water, type: Integer
  field :sleep, type: Integer
  
  #Health  
  def max_hp
    95 + (endurance * 20) + (level * 5)
  end
  
  def hp
    max_hp - @damage.to_i
  end
  
  #TODO:  AP weapons, armour DR, etc
  def damage(d)
    @damage ||= 0
    @damage += d
  end
  
  #AP Stuff
  def max_ap
    10 + agility
  end
  
  def reset_ap
    @ap = max_hp
  end
  
  def evade
    agility + (@ap/2)
  end
  
  def complete
    self.race.to_s.length > 0
  end
  
end