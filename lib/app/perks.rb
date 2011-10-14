class Perk
  include Mongoid::Document
  embedded_in :character
  
  field :name,  type: String
  index :name, unique: true
  
  field :rank,  type: Integer
end