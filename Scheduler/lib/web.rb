require 'sinatra'
require 'activity'
require 'activity_array'
require 'task_array'

activity_array=ActivityArray.new
task_array=TaskArray.new

get '/activities/?:condition?' do
  selection = params[:condition].nil? ? proc { true } : proc { |a| a.complete? == false }
  @selected_activities = activity_array.select &selection
  erb :activities
end

get '/tasks/?:condition?' do
  selection = params[:condition].nil? ? proc { true } : proc { |a| a.complete? == false }
  @selected_tasks = task_array.select &selection
  erb :tasks
end

get '/add_activity' do
  @activity = nil
  erb :add_activity
end
post '/insert_activity' do
  activity = Activity.new(Time.now.to_i, params[:title], params[:start_time], params[:duration].to_i, params[:description],
                          params[:priority], params[:location], params[:notes])
  activity_array << activity
  redirect '/activities'
end

get '/edit_activity/:id' do
  @activity = (activity_array.select { |a| a.id == params[:id].to_i }).first
  erb :add_activity
end

get '/delete_activity/:id' do
  activity_array.delete_if { |a| a.id == params[:id].to_i }
  redirect '/activities'
end

post '/do_edit_activity' do
  activities = activity_array.select { |a| a.id == params[:id].to_i }
  activity = activities.first
  activity.title = params[:title]
  activity.start_time = ActivityTime.new(params[:start_time])
  activity.duration = params[:duration]
  activity.description = params[:description]
  activity.complete = params[:is_done] == "yes"
  activity.location = params[:location]
  activity.notes = params[:notes]
  activity.priority = params[:priority]
  redirect '/activities'
end

get '/add_task' do
  @task = nil
  erb :add_task
end
post '/insert_task' do
  task = Task.new(Time.now.to_i, params[:title], params[:description],params[:priority], params[:location], params[:notes])
  task_array << task
  redirect '/tasks'
end

get '/edit_task/:id' do
  @task = (task_array.select { |a| a.id == params[:id].to_i }).first
  erb :add_task
end

get '/delete_task/:id' do
  task_array.delete_if { |a| a.id == params[:id].to_i }
  redirect '/tasks'
end

post '/do_edit_task' do
  tasks = task_array.select { |a| a.id == params[:id].to_i }
  task = tasks.first
  task.title = params[:title]
  task.description = params[:description]
  task.complete = params[:is_done] == "yes"
  task.location = params[:location]
  task.notes = params[:notes]
  task.priority = params[:priority]
  redirect '/tasks'
end

get '/' do
  erb :index
end
