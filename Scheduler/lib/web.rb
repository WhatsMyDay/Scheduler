require 'sinatra'
require 'activity'
require 'activityarray'

array=ActivityArray.new

get '/activities/?:list?' do
  result=""
  skip_if_done = !params[:list].nil?
  array.each do |activity|
    if not (activity.is_done && skip_if_done)
      result += activity.to_s +
        " <a href=\"edit_activity/"+activity.id.to_s+"\">Edit</a>" +
        " <a href=\"delete_activity/" + activity.id.to_s + "\">Delete</a> <br>"
    end
  end
  result
end

get '/add_activity' do
  erb:add_activity
end

post '/insert_activity' do
  title=params[:title]
  start_time = params[:start_time]
  duration = params[:duration]
  description = params[:description]
  priority = params[:priority]
  activity = Activity.new(Time.now.to_i, title, start_time, duration.to_i, description, priority)
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
  activity.start_time = params[:start_time].to_s
  activity.duration = params[:duration].to_s
  activity.description = params[:description].to_s
  activity.is_done = params[:is_done].to_s
 end
