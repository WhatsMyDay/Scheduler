require 'rspec'
require '../lib/activityarray.rb'

describe ActivityArray do
  it "should be instantiated as an empty array" do
    subject.length.should == 0
  end

  it "should load one activities from a file" do
    f=File.new("testfile", "w")
    f.write("100 | doctor | 23/01/2011 04:23 | 00:30 | general checkup\n")
    f.close()

    subject.load_from_file("testfile")
    subject.length.should == 1
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].date.should == Time.mktime(2011,01,23,4,23)
    subject[0].duration.should == 30
    subject[0].description == "general checkup"
  end

  it "should load several activities from a file" do
    f=File.new("testfile", "w")
    f.write("100 | doctor | 23/01/2011 04:00 | 00:30 | general checkup\n")
    f.write("200 | dentist | 24/02/2011 07:00 | 00:45 | see hygenist\n")
    f.write("300 | optician | 25/03/2011 10:00 | 01:00 | mend glasses\n")
    f.close()

    subject.load_from_file("testfile")
    subject.length.should == 3
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].date.should == Time.mktime(2011,01,23,4,00)
    subject[0].duration.should == 30
    subject[0].description == "general checkup"

    subject[1].id.should == 200
    subject[1].title.should == "dentist"
    subject[1].date.should == Time.mktime(2011,02,24,7,00)
    subject[1].duration.should == 45
    subject[1].description == "see hygenist"

    subject[2].id.should == 300
    subject[2].title.should == "optician"
    subject[2].date.should == Time.mktime(2011,03,25,10,00)
    subject[2].duration.should == 60
    subject[2].description == "mend glasses"
  end

  it "should store several activities in a file" do
    subject << Activity.new(100, "doctor", Time.mktime(2011,01,23,4,00), 30, "general checkup")
    subject << Activity.new(200, "dentist", Time.mktime(2011,02,24,7,00), 45, "see hygenist")
    subject << Activity.new(300, "optician", Time.mktime(2011,03,25,10,00), 60, "mend glasses")

    subject.store_to_file("output_file.txt")

    f = File.open("output_file.txt")
    f.gets.should == "100 | doctor | 23/01/2011 04:00 | 00:30 | general checkup\n"
    f.gets.should == "200 | dentist | 24/02/2011 07:00 | 00:45 | see hygenist\n"
    f.gets.should == "300 | optician | 25/03/2011 10:00 | 01:00 | mend glasses\n"
    f.close()
  end



end