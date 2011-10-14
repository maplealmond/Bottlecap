class Skill
  include Mongoid::Document
  embedded_in :character
  
  field :name,   type: String
  index :name, unique: true
  
  field :value,  type: Integer
  field :tagged, type: Boolean
end