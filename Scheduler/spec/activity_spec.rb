
require 'rspec'
require '../lib/activity.rb'


describe Activity do

  it "should split the string into sub_strings" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 1:00 | appointment for check_up"
    results = subject.decode_line(test_string)
    results[0].should == "1"
    results[1].should == "Doctor"
    results[2].should == "19/10/2011 16:00"
    results[3].should == "1:00"
    results[4].should == "appointment for check_up"
  end

  it "should store the decoded strings in the class attributes" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 1:00 | appointment for check_up"
    subject.decode_line(test_string)
    subject.id.should == 1
    subject.title.should == "Doctor"
    subject.date.should == Time.mktime(2011, 10, 19, 16, 0)
    subject.duration.should == 60
    subject.description.should == "appointment for check_up"
  end

  it "should have an ID of 356" do
    activity = Activity.new
    activity.id.should == 356
  end
end

