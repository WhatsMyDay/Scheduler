
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












end

