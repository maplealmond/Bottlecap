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
  field :strength,      type: Integer
  field :perception,    type: Integer
  field :endurance,     type: Integer
  field :charisma,      type: Integer
  field :intelligence,  type: Integer
  field :agility,       type: Integer
  field :luck,          type: Integer
  
  def stat_total
    [strength,perception,endurance,charisma,intelligence,agility,luck].map(&:to_i).inject(0) { |x,y| x+y }
  end
  
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
    (todo == nil)
  end
  
  def todo
    return "Select Race" if race.to_s.length == 0
    return "Update Stats" if self.stat_total < 40
    
    untagged = self.skills.where(tagged: true).size - 2
    return "Tag #{untagged} Skills" if untagged > 0
    
    unpicked = self.perks.size - level
    return "Select #{unpicked} Perks" if unpicked > 0
    
    return nil
  end
  
  #We try to catch skills as a method missing, nothing else should be caught this way
  def method_missing(name, *args, &block)
    s = skills.where(name: name).first
    if s
      s.effective_value
    else
      super(name, *args, &block)
    end
  end
  
  def tag_skill(skill)
    skill = skills.find_or_create_by(name: skill)
    skill.tagged = true
    skill.value = skill.value + 15
    skill.save
  end
  
  def untag_skill(skill)
    skill = skills.find_or_create_by(name: skill)
    skill.tagged = false
    skill.save
  end
  
  def practice_skill(skill)
    skill = skills.find_or_create_by(name: skill)
    skill.practice = true
    skill.save
  end
  
  def advance_skills    
    skills.all.each do |skill|
      before = skill.advancement
      skill.advance  
      skill.save
    end
  end
  
  def take_perk(perk)
    perk = perks.find_or_create_by(name: perk)
    perk.rank = perk.rank.to_i + 1
    perk.save
  end
  
  def sequence
    perception + agility
  end  
  
end