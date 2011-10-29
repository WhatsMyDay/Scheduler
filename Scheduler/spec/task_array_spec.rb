require 'rspec'
require '../lib/task_array.rb'

describe TaskArray do
  it "should be instantiated as an empty array" do
    subject.length.should == 0
  end

  it "should load one task from a file" do
    f=File.new("test_task_load.txt", "w")
    f.write("100 | doctor | general checkup | done | urgent | Manchester | near Oxford street\n")
    f.close()

    subject.load_from_file("test_task_load.txt")
    subject.length.should == 1
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].description == "general checkup"
    subject[0].complete? == true
    subject[0].priority =="urgent"
    subject[0].location == "Manchester"
    subject[0].notes == "near Oxford street"
  end

  it "should load several activities from a file" do
    f=File.new("test_task_load.txt", "w")
    f.write("100 | doctor | general checkup | done | urgent | Manchester | near Oxford street\n")
    f.write("200 | dentist | see hygienist | done | urgent | Manchester | near Oxford street\n")
    f.write("300 | optician | mend glasses | done | urgent | Manchester | near Oxford street\n")
    f.close()

    subject.load_from_file("test_task_load.txt")
    subject.length.should == 3
    subject[0].id.should == 100
    subject[0].title.should == "doctor"
    subject[0].description.should == "general checkup"
    subject[0].complete?.should == true
    subject[0].priority.should == "urgent"
    subject[0].location.should == "Manchester"
    subject[0].notes.should == "near Oxford street"

    subject[1].id.should == 200
    subject[1].title.should == "dentist"
    subject[1].description.should == "see hygienist"
    subject[1].complete?.should == true
    subject[1].priority.should == "urgent"
    subject[1].location.should == "Manchester"
    subject[1].notes.should == "near Oxford street"

    subject[2].id.should == 300
    subject[2].title.should == "optician"
    subject[2].description.should == "mend glasses"
    subject[2].complete?.should == true
    subject[2].priority.should == "urgent"
    subject[2].location.should == "Manchester"
    subject[2].notes.should == "near Oxford street"
  end

  it "should store several activities in a file" do
    subject << Task.new(100, "doctor", "general checkup", "urgent", "Manchester", "near Oxford street")
    subject << Task.new(200, "dentist", "see hygienist", "urgent", "Manchester", "near Oxford street")
    subject << Task.new(300, "optician", "mend glasses", "urgent", "Manchester", "near Oxford street")

    subject.store_to_file("task_output_file.txt")

    f = File.open("task_output_file.txt")
    f.gets.should == "100 | doctor | general checkup | not done | urgent | Manchester | near Oxford street\n"
    f.gets.should == "200 | dentist | see hygienist | not done | urgent | Manchester | near Oxford street\n"
    f.gets.should == "300 | optician | mend glasses | not done | urgent | Manchester | near Oxford street\n"
    f.close()
  end
end