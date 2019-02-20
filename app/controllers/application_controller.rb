class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :database_file, 'config/database.yml'
  end

  get '/' do
    @title = 'Welcome to the Suffragist!'
    @choices = Choice.all
    erb :index
  end

  post '/cast' do
    @title = 'Thanks for casting your vote!'
    choice = Choice.find(params["vote"].to_i)
    @vote = choice.name
    choice.votes += 1
    choice.save
    erb :cast
  end

  get '/results' do
    @title = 'Results so far:'
    @choices = Choice.all
    erb :results
  end

  get '/message' do
    @title = 'Provide a message for fellow suffragists!'
    erb :message
  end

  post '/message' do
    @title = 'Thank you for your contribution!'
    # binding.pry
    @message = Message.create(name: params["name"], message: params["message"])
    erb :message_post
  end

end
