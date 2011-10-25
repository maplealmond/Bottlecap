class Skill
  include Mongoid::Document
  embedded_in :character
  
  field :name,   type: String
  index :name, unique: true
  
  field :value,  type: Integer
  field :tagged, type: Boolean

  field :practice, type: Boolean
  field :advancement, type: Integer
  
  def value
    return read_attribute(:value).to_i
  end
  
  def advancement
    return read_attribute(:advancement).to_i
  end
  
  def effective_value
    stat = character.send(character.game.skills[self.name.to_sym]).to_i
    luck = character.luck
    value + 2 * stat + luck 
  end
    
  def advance  
    return unless self.practice
    self.practice = false
    
    self.advancement = self.advancement + 1
        
    if (tagged) or (advancement >= 5)
      self.advancement = 0
      self.value = [value + 1, (character.level * 2) + 20].min
    end
  end
  
end