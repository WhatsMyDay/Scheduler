require "rspec"
require "../lib/object_array.rb"

describe ObjectArray do
  it "should get the class name" do
  subject.get_class_name().should=="Object"
  end
end