class Game
  attr_accessor :name
  
  def self.skills
    %w(
      athletics
      awareness
      deception
      firearms
      mechanics
      medic
      melee
      persuasion
      pilot
      security
      science
      sneak
      steal
      survival
    )
  end
  
  def self.lore
    %w(
      history
      philosophy
    )
  end
  
end