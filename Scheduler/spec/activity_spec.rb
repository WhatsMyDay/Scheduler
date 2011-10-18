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

  it "should show the toString result" do
    activity1 = Activity.new(1324,"Dental appointment",13/13/2011,"3 hours","Kilburn building")
    activity1.to_s.should=="id:" + activity1.id.to_s + " title:" + activity1.title.to_s + "date:" + activity1.date.to_s + "duration:" + activity1.duration.to_s + "description: " + activity1.description.to_s
  end

end

