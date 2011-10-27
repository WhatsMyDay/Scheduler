require 'sinatra'
require 'activity'
require 'activity_array'

array=ActivityArray.new

get '/activities/?:condition?' do
  selection = params[:condition].nil? ? proc { true } : proc { |a| a.is_done == false }

  @selected_activities = array.select &selection

  erb :activities
end

get '/add_activity' do
  @activity = nil

  erb :add_activity
end

post '/insert_activity' do
  activity = Activity.new(Time.now.to_i, params[:title], params[:start_time], params[:duration].to_i, params[:description],
                          params[:priority], params[:location], params[:notes])
  array << activity

  redirect '/activities'
end

get '/edit_activity/:id' do
  @activity = (array.select { |a| a.id == params[:id].to_i }).first

  erb :add_activity
end


get '/delete_activity/:id' do
  array.delete_if { |a| a.id == params[:id].to_i }

  redirect '/activities'
end
post '/do_edit_activity' do
  activities = array.select { |a| a.id == params[:id].to_i }
  activity = activities.first
  activity.title = params[:title]
  activity.start_time = ActivityTime.new(params[:start_time])
  activity.duration = params[:duration]
  activity.description = params[:description]
  activity.is_done = params[:is_done] == "yes"
  activity.location = params[:location]
  activity.notes = params[:notes]
  activity.priority = params[:priority]

  redirect '/activities'
end

get '/' do
  erb :index
end
