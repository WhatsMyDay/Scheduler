require 'sinatra'
require 'lib/activity'
get '/add_activity' do
  erb:add_activity
end

post '/insert_activity' do
  title=params[:title]
  date = params[:date]
  duration = params[:duration]
  description = params[:description]

  activity=Activity.new(1,title,date,duration,description);
  activity.to_s
end
