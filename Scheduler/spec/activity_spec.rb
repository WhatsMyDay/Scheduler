require 'rspec'
require '../lib/activity.rb'

describe Activity do
  it "should split the string into sub_strings" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | done"
    results = subject.decode_line(test_string)
    results[0].should == "1"
    results[1].should == "Doctor"
    results[2].should == "19/10/2011 16:00"
    results[3].should == "01:00"
    results[4].should == "appointment for check_up"
    results[5].should == "done"
  end

  it "should store the decoded strings in the class attributes" do
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | done"
    subject.decode_line(test_string)
    subject.id.should == 1
    subject.title.should == "Doctor"
    subject.date.should == Time.mktime(2011, 10, 19, 16, 0)
    subject.duration.should == 60
    subject.description.should == "appointment for check_up"
    subject.status.should == "done"
  end

  it "should encode the class into the string" do
    activity = Activity.new(1, "Doctor", Time.mktime(2011, 10, 19, 16, 0), 60, "appointment for check_up", "done")
    test_string = "1 | Doctor | 19/10/2011 16:00 | 01:00 | appointment for check_up | done"
    activity.encode_line().should ==test_string
  end

  it "should have an ID of 356" do
    activity = Activity.new(356, "hi", 13/13/2011, "3 hours", "Hi")
    activity.id.should == 356
  end

  it "should show the toString result" do
    activity1 = Activity.new(1324, "Dental appointment", 13/13/2011, "3 hours", "Killburn building", "done")
    activity1.to_s.should=="id:" + activity1.id.to_s + " title:" + activity1.title.to_s + "date:" + activity1.date.to_s + "duration:" + activity1.duration.to_s + "description:" + activity1.description.to_s + "status:" + activity1.status.to_s
  end

  it "should update the status"do
     activity1 = Activity.new(1234,"Dental appointment", 13/3/2011, "3 hours", "Killburn building","")

     activity1.change_status('done')
     activity1.status.should == 'done'
    end


end
