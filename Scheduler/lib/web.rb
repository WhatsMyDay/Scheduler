require 'sinatra'
require 'activity'
require 'activityarray'

array=ActivityArray.new

get '/activities' do
  result=""
  array.each do |activity|
    result += activity.to_s +
        " <a href=\"edit_activity/"+activity.id.to_s+"\">Edit</a>" +
        " <a href=\"delete_activity/" + activity.id.to_s + "\">Delete</a> <br>"
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
  priority = params[:priority]
  activity = Activity.new(Time.now.to_i, title, date, duration.to_i, description, priority)
  array << activity
  array.store_to_file("saved_activities.txt")

  redirect '/activities'
end

get '/edit_activity/:id' do
  activities = array.select { |a| a.id == params[:id].to_i }
  @activity = activities.first
  erb :edit_activity
end

get '/delete_activity/:id' do
  array.delete_if { |a| a.id == params[:id].to_i }

  redirect '/activities'
end

post'/do_edit_activity' do
  activities = array.select { |a| a.id == params[:id].to_i}
  activity = activities.first
  activity.title = params[:title].to_s
  activity.date = params[:date].to_s
  activity.duration = params[:duration].to_s
  activity.description = params[:description].to_s
  activity.status = params[:status].to_s
 end

