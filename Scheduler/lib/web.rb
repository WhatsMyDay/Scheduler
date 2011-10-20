require 'sinatra'
require 'activity'
require 'activityarray'

array=ActivityArray.new

get '/activities' do
  #erb:activities
  result=""
  array.each do |activity|
   result+=activity.to_s+" <a href=\"edit_activity/"+activity.id.to_s+"\">Edit</a>"
  end
  result
end

get '/add_activity' do
  erb:add_activity
end

post '/insert_activity' do
  title=params[:title]
  date = params[:date]
  duration = params[:duration]
  description = params[:description]
  m = /(\d\d)\/(\d\d)\/(\d\d\d\d)\s(\d\d):(\d\d)/.match(date)
  start_time = Time.mktime(m[3].to_i, m[2].to_i, m[1].to_i, m[4].to_i, m[5].to_i)
  activity = Activity.new(100, title, start_time, duration.to_i, description)
  array << activity
  array.store_to_file("saved_activities.txt")
end

get '/edit_activity/:id' do
  activities = array.select { |a| a.id == params[:id].to_i }
  @activity = activities.first
  erb :edit_activity
end


get '/delete_activity/:id' do
  array.delete_if { |a| a.id == params[:id].to_i }

end

