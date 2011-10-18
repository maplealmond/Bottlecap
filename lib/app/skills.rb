class Skill
  include Mongoid::Document
  embedded_in :character
  
  field :name,   type: String
  index :name, unique: true
  
  field :value,  type: Integer
  field :tagged, type: Boolean
  
  def effective_value
    stat = character.send_message(character.game.skills[self.name.to_sym])
    luck = character.luck
    value + 2 * stat + luck 
  end
  
end