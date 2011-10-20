require 'spec_helper'
require 'app/controller'

describe Controller do
  before (:all) do
    @controller = Controller.new
  end
  
  it "parses a fudge request" do    
    @controller.parse("fudge 30").should == "Next die roll fudged to 30"    
  end
  
end