require "rspec"
require '../lib/activityarray.rb'

describe ActivityArray do
  it "should be instantiated as an empty array" do
    subject.length.should == 0
  end

  it "should load the activities from a file" do
    f=File.new("testfile", "w")
    f.write("100 | doctor | 23/01/2011 04:23 | 0:30 | general checkup\n")
    f.close()

    subject.load_from_file("testfile")
    subject.length.should == 1
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].date.should == Time.mktime(2011,01,23,4,23)
    subject[0].duration.should == 30
    subject[0].description == "general checkup"
  end
end