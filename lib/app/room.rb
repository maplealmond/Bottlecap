class Room
  include Mongoid::Document
  
  field :name, type: String
  index :name, unique: true

  field :desc, type: String
  field :exam, type: String
  
  has_and_belongs_to_many :move, :inverse_of => :move,  :class_name => 'Room'
      
end
