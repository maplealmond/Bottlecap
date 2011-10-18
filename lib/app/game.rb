class Game
  include Mongoid::Document
    
  field :name, type: String
  index :name, unique: true
  has_many :characters
  
  def skills
    {
      athletics:  :st,
      awareness:  :pe,
      deception:  :ch,
      firearms:   :ag,
      mechanics:  :in,
      medic:      :in,
      melee:      :st,
      persuasion: :ch,
      pilot:      :ag,
      security:   :ag,
      science:    :in,
      sneak:      :ag,
      steal:      :ag,
      survival:   :in
    }
  end
  
  def stat_total; 40; end
  
end