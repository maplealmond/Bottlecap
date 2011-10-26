require 'spec_helper'
require 'app/room'
require 'app/map'

describe Room do
  
  before(:each) do
    @map = Map.new(name: "Test")
  end
  
  it 'can be added to a map' do
    @map.rooms << Room.new(name: "Front Door")
    @map.rooms.size > 0
  end
  
  it 'can link to another room' do
    room1 = Room.new(name: "Front Door")
    room2 = Room.new(name: "Hallway")
    
    room1.links.push room2
    room2.links.push room1
    
    room1.links.first.should == room2
    room2.links.first.should == room1
  end
  
  
end