require 'sinatra'
get '/add_activity' do
  erb:add_activity
end

post '/insert_activity' do
  title=params[:title]
  date = params[:date]
  duration = params[:duration]
  description = params[:description]
  title+"<br> "+date +"<br> " +duration + "<br> " + description
end
