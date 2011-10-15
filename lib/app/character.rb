require './lib/app/skills'
require './lib/app/perks'

class Character
  include Mongoid::Document
  belongs_to :game
  
  #Basic Info
  field :name, type: String
  index :name, unique: true
  
  field :race, type: String
      
  #Core Stats
  field :st, type: Integer
  field :pe, type: Integer
  field :en, type: Integer
  field :ch, type: Integer
  field :in, type: Integer
  field :ag, type: Integer
  field :lk, type: Integer
  
  #Skills
  embeds_many :skills
  embeds_many :perks
  
  #Potential problems
  field :damage, type: Integer
  field :rads, type: Integer
  field :food, type: Integer
  field :water, type: Integer
  field :sleep, type: Integer
  
  #Level and XP
  field :experience, type: Integer
  
  #Setting level should not be common for players.  Actually sets the XP to minimum for that level.
  def level=(n)
    self.experience = (25 * (3 * n + 2) * (n - 1))
    @level = n
  end
  
  def level
    unless @level
      @level = ((1 + Math.sqrt(1 + (12 * ((experience.to_i / 25) + 2)))) / 6).to_i
    end
    return @level
  end
  
  def add_xp(n)
    self.experience = self.experience.to_i + n
    @level = nil
  end
  
  #Health  
  def max_hp
    95 + (en * 20) + (level * 5)
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
    10 + ag
  end
  
  def reset_ap
    @ap = max_hp
  end
  
  def evade
    ag + (@ap/2)
  end
  
  def complete
    self.race.to_s.length > 0 and \
    self.skills.where(tagged: true).size >= 2 and \
    self.perks.size >= level
  end
  
  def tag_skill(skill)
    skill = skills.find_or_create_by(name: skill)
    skill.tagged = true
    skill.save
  end
  
  def take_perk(perk)
    perk = perks.find_or_create_by(name: perk)
    perk.rank = perk.rank.to_i + 1
    perk.save
  end
  
  def sequence
    pe + ag
  end
  
end