require 'sinatra'

Choices = {
    'HAM' => 'Hamburger',
    'PIZ' => 'Pizza',
    'CUR' => 'Curry',
    'NOO' => 'Noodles',
}

get '/' do
  @title = 'Welcome to the Suffragist!'
  erb :index
end

post '/cast' do
  @title = 'Thanks for casting your vote!'
  @vote = params['vote']
  erb :cast
end