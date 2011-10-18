

require 'rspec'
require '../lib/activity.rb'


describe Activity do


  it "should have an ID of 356"     do


      activity = Activity.new(356,"hi",13/13/2011,"3 hours","Hi")

      activity.id.should == 356

  end




  it "should list all activities" do

                    activity = Activity.new(1324,"hi",13/13/2011,"3 hours","Hi")
                    activity.list




  end




end

