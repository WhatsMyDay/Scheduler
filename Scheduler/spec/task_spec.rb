require 'rspec'
require '../lib/task.rb'

describe Task do
  context 'Loading and storing to file by en/decoding lines' do
    it "should split the string into sub_strings" do
      test_string = "1 | Doctor | appointment for check_up | done | urgent | Manchester | near Oxford street"
      results = subject.decode_line(test_string)
      results[0].should == "1"
      results[1].should == "Doctor"
      results[2].should == "appointment for check_up"
      results[3].should == "done"
      results[4].should == "urgent"
      results[5].should == "Manchester"
      results[6].should == "near Oxford street"
    end

    it "should store the decoded strings in the class attributes" do
      test_string = "1 | Doctor | appointment for check_up | done | urgent | Manchester | near Oxford street"
      subject.decode_line(test_string)
      subject.id.should == 1
      subject.title.should == "Doctor"
      subject.description.should == "appointment for check_up"
      subject.complete?.should == true
      subject.priority.should == "urgent"
      subject.location.should == "Manchester"
      subject.notes.should == "near Oxford street"

    end

    it "should encode the class into the string" do
      task = Task.new(1, "Doctor", "appointment for check_up", "low", "Manchester", "near Oxford street")
      test_string = "1 | Doctor | appointment for check_up | not done | low | Manchester | near Oxford street"
      task.encode_line().should ==test_string
    end
  end

  context 'Class and attribute manipulation' do
    it "should have an ID of 356" do
      task = Task.new(356, "Dentist", "For X-Rays", "normal", "Manchester", "near Oxford street")
      task.id.should == 356
    end

    it "should update the status" do
      task1 = Task.new(1234, "Dental appointment", "Kilburn building", "urgent", "Manchester", "near Oxford street")
      task1.complete = true
      task1.complete?.should == true
      task1.complete = false
      task1.complete?.should == false
    end
  end

  context 'To string functionality' do
    it "should show the toString result" do
      task1 = Task.new(1324, "Dental appointment", "Kilburn building", "urgent", "Manchester", "near Oxford street")
      task1.to_s.should=='Dental appointment - Kilburn building > not done, urgent in Manchester near Oxford street'
    end
  end
end
