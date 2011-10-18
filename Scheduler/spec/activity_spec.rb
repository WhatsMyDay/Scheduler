

require 'rspec'
require '../lib/activity.rb'


describe Activity do


  it "should have an ID of 356"     do


      activity = Activity.new

      activity.id.should == 356

  end




end

