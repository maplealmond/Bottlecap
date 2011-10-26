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
  embeds_many :skills do  
    def named(n)
      where(name: n).first or Skill.new(character: self.base, name: n)
    end
  end
  
  embeds_many :perks do  
    def named(n)
      where(name: n).first
    end
  end
  
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
  def test(skill)
    s = self.skills.named(skill)
    Dice.test(s.effective_value)
  end
  
  def tag_skill(skill)
    skill = skills.named(skill)
    skill.value += 15 unless skill.tagged
    skill.tagged = true
  end
  
  def untag_skill(skill)
    skill = skills.named(skill)
    skill.value -= 15 if skill.tagged
    skill.tagged = false
  end
  
  def practice_skill(skill)
    skills.named(skill).practice = true
  end
  
  def advance_skills    
    skills.all.each do |skill|
      before = skill.advancement
      skill.advance  
    end
  end
  
  def take_perk(perk)
    perk = perks.named(perk) || Perk.new(name: perk, character: self)
    perk.rank = perk.rank.to_i + 1
  end
  
  def sequence
    perception + agility
  end  
  
end