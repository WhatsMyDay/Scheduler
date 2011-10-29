require 'rspec'
require '../lib/activity_time.rb'

describe ActivityTime do
  context "Time string encoding and decoding" do
    it "should be decoded from the standard string" do
      time_string = '22/10/2011 11:50'
      a_time = ActivityTime.new(time_string)
      a_time.time.year.should == 2011
      a_time.time.month.should == 10
      a_time.time.day.should == 22
      a_time.time.hour.should == 11
      a_time.time.min.should == 50
    end

    it "should create a standard output string" do
      time_string = '22/10/2011 11:50'
      a_time = ActivityTime.new(time_string)
      a_time.to_s.should == time_string
    end
  end

  context "Time comparison" do
    it "should compare two dates" do
      start_time = '22/10/2011 11:30'
      end_time = '30/10/2011 16:34'
      time1 = ActivityTime.new(start_time)
      time2 = ActivityTime.new(end_time)
      (time1 < time2).should == true
      (time1 > time2).should == false
      (time1 == time2).should == false
      (time2 < time1).should == false
      (time2 > time1).should == true
      (time1 == time1).should == true
      (time1 <= time2).should == true
      (time1 >= time2).should == false
    end
  end
end