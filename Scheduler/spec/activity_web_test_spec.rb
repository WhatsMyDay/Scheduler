require 'rspec'
require '../lib/activity.rb'
require "watir-webdriver"
require "rubygems"

describe Activity do
  browser = Watir::Browser.new :ff

  it "should create an activity on web page" do
    browser.goto "localhost:4567/add_activity"
    browser.text_field(:name => "title").set "Doctor"
    browser.text_field(:name => "start_time").set "16/10/2011 10:11"
    browser.text_field(:name => "duration").set "30"
    browser.text_field(:name => "description").set "Check up!"
    browser.radio(:name => "priority", :value => "normal").set
    browser.text_field(:name => "location").set "Liverpool"
    browser.text_field(:name => "notes").set "near Oxford street"
    browser.button(:value => "Submit").click
    browser.url.should=="http://localhost:4567/activities"
  end

  it "should edit an activity" do
    browser.goto "localhost:4567/activities"
    browser.link(:name => "edit" ).click
    browser.text_field(:name => "title").set "Dentist"
    browser.text_field(:name => "start_time").set "16/10/2011 10:15"
    browser.text_field(:name => "duration").set "20"
    browser.text_field(:name => "description").set "Dental Checkup"
    browser.text_field(:name => "location").set "Manchester"
    browser.text_field(:name => "notes").set "outside Oxford street"
    browser.select_list(:name => 'is_done').select "Yes"
    browser.radio(:name => "priority", :value => "urgent").set
    browser.button(:value=> "Submit").click
    browser.url.should=="http://localhost:4567/activities"
  end
end