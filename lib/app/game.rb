require './lib/app/character'

class Game
  include Mongoid::Document
  
  field :name, type: String
  index :name, unique: true
  
  embeds_many :characters do  
    def named(n)
      where(name: n).first
    end
  end
  
  def skills
    {
      athletics:  :strength,
      awareness:  :perception,
      deception:  :charisma,
      firearms:   :agility,
      mechanics:  :inteligence,
      medic:      :inteligence,
      melee:      :strength,
      persuasion: :charisma,
      pilot:      :agility,
      security:   :agility,
      science:    :inteligence,
      sneak:      :agility,
      steal:      :agility,
      survival:   :inteligence
    }
  end
  
  def stat_total; 40; end
  
end