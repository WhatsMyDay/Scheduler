require 'rspec'
require '../lib/activity_time.rb'

describe ActivityTime do
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