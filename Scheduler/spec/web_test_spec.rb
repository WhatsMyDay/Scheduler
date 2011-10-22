require 'rspec'
require '../lib/activity.rb'
require "watir-webdriver"
require "rubygems"



describe Activity do
  #it "should fill the form and create an activity on web page" do
  #  browser = Watir::Browser.new :ff
  #  browser.goto "localhost:4567/add_activity"
  #  browser.text_field(:name => "title").set "Doctor"
  #  browser.text_field(:name => "date").set "16/10/2011 10:11:15"
  #  browser.text_field(:name => "duration").set "30"
  #  browser.text_field(:name => "description").set "Check up!"
  #  browser.button(:value => "Create!").click
  #  browser.url.should=="http://localhost:4567/insert_activity"
  #end
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

end
