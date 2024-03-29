require './lib/app/room'

class Map
  include Mongoid::Document
  
  field :name, type: String
  index :name, unique: true
  
  embeds_many :rooms do  
    def named(n)
      where(name: n).first
    end
  end
  
  def parse
    #This loads up a map, and internally evaluates it
  end
  
end
