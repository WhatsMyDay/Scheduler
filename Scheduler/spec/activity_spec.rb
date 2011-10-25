require 'rspec'
require '../lib/activity.rb'

describe Activity do
  it "should split the string into sub_strings" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | done | urgent | Manchester"
    results = subject.decode_line(test_string)
    results[0].should == "1"
    results[1].should == "Doctor"
    results[2].should == "19/10/2011 16:00"
    results[3].should == "01:00"
    results[4].should == "appointment for check_up"
    results[5].should == "done"
    results[6].should == "urgent"
    results[7].should == "Manchester"
  end

  it "should store the decoded strings in the class attributes" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | done | urgent | Manchester"
    subject.decode_line(test_string)
    subject.id.should == 1
    subject.title.should == "Doctor"
    subject.start_time.to_s.should == "19/10/2011 16:00"
    subject.duration.should == 60
    subject.description.should == "appointment for check_up"
    subject.is_done.should == true
    subject.priority.should == "urgent"
    subject.location.should == "Manchester"
  end

  it "should encode the class into the string" do
    activity = Activity.new(1, "Doctor", "19/10/2011 16:00", 60, "appointment for check_up", "low", "Manchester")
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | not done | low | Manchester"
    activity.encode_line().should ==test_string
  end

  it "should have an ID of 356" do
    activity = Activity.new(356, "Dentist", "19/10/2011 16:00", "01:00", "For X-Rays", "normal", "Manchester")
    activity.id.should == 356
  end

  it "should show the toString result" do
    activity1 = Activity.new(1324, "Dental appointment", "19/10/2011 16:00", "3 hours", "Kilburn building", "urgent", "Manchester")
    activity1.to_s.should=='19/10/2011 16:00 (3 hours) Dental appointment - Kilburn building > not done, urgent in Manchester'
  end

  it "should update the status" do
    activity1 = Activity.new(1234, "Dental appointment", "19/10/2011 16:00", "3 hours", "Kilburn building", "urgent", "Manchester")
    activity1.is_done = true
    activity1.is_done.should == true
    activity1.is_done = false
    activity1.is_done.should == false
  end
end
