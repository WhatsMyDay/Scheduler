require 'rspec'
require '../lib/activity.rb'
require "watir-webdriver"
require "rubygems"



describe Activity do

  it "should create and edit an activity on web page" do
    browser = Watir::Browser.new :ff
    browser.goto "localhost:4567/add_activity"
    browser.text_field(:name => "title").set "Doctor"
    browser.text_field(:name => "date").set "16/10/2011 10:11:15"
    browser.text_field(:name => "duration").set "30"
    browser.text_field(:name => "description").set "Check up!"
    browser.button(:value => "Create!").click
    browser.url.should=="http://localhost:4567/insert_activity"
    browser.goto "localhost:4567/activities"
    browser.link(:text => "Edit").click
    browser.select_list(:id, "status").set("Done")

  end

  it "should edit an activity" do
    browser = Watir::Browser.new :ff
    browser.goto "localhost:4567/activities"
    browser.link(:text => "Edit").click
    browser.text_field(:name => "title").set "Dentist"
    browser.text_field(:name => "date").set "16/10/2011 10:15"
    browser.text_field(:name => "duration").set "20"
    browser.text_field(:name => "description").set "Dental Checkup"
    browser.select_list(:name => 'is_done').select 'Yes'
    browser.radio(:value => "Urgent").set
    browser.button(:value=> "Change").click
    browser.url.should=="http://localhost:4567/activities"
  end

end
