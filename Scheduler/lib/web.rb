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
        " <a href=\"/edit_activity/"+activity.id.to_s+"\">Edit</a>" +
        " <a href=\"/delete_activity/" + activity.id.to_s + "\">Delete</a> <br>"
    end
  end
  result
end

get '/add_activity' do
  erb:add_activity
end

post '/insert_activity' do
 activity = Activity.new(Time.now.to_i, params[:title], params[:start_time], params[:duration].to_i, params[:description],
                          params[:priority], params[:location])
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
   activity.title = params[:title]
   activity.start_time = ActivityTime.new(params[:start_time])
   activity.duration = params[:duration]
   activity.description = params[:description]
   activity.is_done = params[:is_done]
   activity.location = params[:location]
   activity.priority = params[:priority]
   if (params[:is_done]=="yes")then
   activity.is_done =true
    puts "activity status is changed to done" + params[:is_done]
   else
     activity.is_done = false
     puts "activity status is changed to not done" + params[:is_done]
  end
   redirect '/activities'

 end

