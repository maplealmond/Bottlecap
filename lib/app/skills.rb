class Skill
  include Mongoid::Document
  embedded_in :character
  
  field :name,   type: String
  index :name, unique: true
  
  field :value,  type: Integer
  field :tagged, type: Boolean
  
  def effective_value
    stat = character.send(character.game.skills[self.name.to_sym]).to_i
    luck = character.luck
    value + 2 * stat + luck 
  end
  
end