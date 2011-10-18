

require 'rspec'
require '../lib/activity.rb'


describe Activity do

  it "should split the string into sub_strings" do
    test_string = "1 | Doctor | 4:00 | 1:00 | appointment for check_up"
    results =subject.decode_line(test_string)
    results[0].should == "1"
    results[1].should == "Doctor"
    results[2].should == "4:00"
    results[3].should == "1:00"
    results[4].should == "appointment for check_up"

  end

  it "should have an ID of 356"     do


    activity = Activity.new(356,"hi",13/13/2011,"3 hours","Hi")

    activity.id.should == 356

  end




  it "should list all activities" do

    activity = Activity.new(1324,"hi",13/13/2011,"3 hours","Hi")
    activity.list

  end




end

