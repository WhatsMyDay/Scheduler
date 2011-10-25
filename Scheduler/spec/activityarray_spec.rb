require 'rspec'
require '../lib/activityarray.rb'

describe ActivityArray do
  it "should be instantiated as an empty array" do
    subject.length.should == 0
  end

  it "should load one activities from a file" do
    f=File.new("testfile", "w")
    f.write("100 | doctor | 23/01/2011 04:23 | 00:30 | general checkup | done | urgent | Manchester\n")
    f.close()

    subject.load_from_file("testfile")
    subject.length.should == 1
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].start_time.to_s.should == '23/01/2011 04:23'
    subject[0].duration.should == 30
    subject[0].description == "general checkup"
    subject[0].is_done == true
    subject[0].priority =="urgent"
    subject[0].location == "Manchester"
  end

  it "should load several activities from a file" do
    f=File.new("testfile", "w")
    f.write("100 | doctor | 23/01/2011 04:00 | 00:30 | general checkup | done | urgent | Manchester\n")
    f.write("200 | dentist | 24/02/2011 07:00 | 00:45 | see hygenist | done | urgent | Manchester\n")
    f.write("300 | optician | 25/03/2011 10:00 | 01:00 | mend glasses | done | urgent | Manchester\n")
    f.close()

    subject.load_from_file("testfile")
    subject.length.should == 3
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].start_time.to_s.should == '23/01/2011 04:00'
    subject[0].duration.should == 30
    subject[0].description.should == "general checkup"
    subject[0].is_done.should == true
    subject[0].priority.should == "urgent"
    subject[0].location.should == "Manchester"

    subject[1].id.should == 200
    subject[1].title.should == "dentist"
    subject[1].start_time.to_s.should == '24/02/2011 07:00'
    subject[1].duration.should == 45
    subject[1].description.should == "see hygenist"
    subject[1].is_done.should == true
    subject[1].priority.should == "urgent"
    subject[1].location.should == "Manchester"

    subject[2].id.should == 300
    subject[2].title.should == "optician"
    subject[2].start_time.to_s.should == '25/03/2011 10:00'
    subject[2].duration.should == 60
    subject[2].description.should == "mend glasses"
    subject[2].is_done.should == true
    subject[2].priority.should == "urgent"
    subject[2].location.should == "Manchester"
  end

  it "should store several activities in a file" do
    subject << Activity.new(100, "doctor", '23/01/2011 04:00', 30, "general checkup", "urgent", "Manchester")
    subject << Activity.new(200, "dentist", '24/02/2011 07:00', 45, "see hygenist", "urgent", "Manchester")
    subject << Activity.new(300, "optician", '25/03/2011 10:00', 60, "mend glasses", "urgent", "Manchester")

    subject.store_to_file("output_file.txt")

    f = File.open("output_file.txt")
    f.gets.should == "100 | doctor | 23/01/2011 04:00 | 00:30 | general checkup | not done | urgent | Manchester\n"
    f.gets.should == "200 | dentist | 24/02/2011 07:00 | 00:45 | see hygenist | not done | urgent | Manchester\n"
    f.gets.should == "300 | optician | 25/03/2011 10:00 | 01:00 | mend glasses | not done | urgent | Manchester\n"
    f.close()
  end
end