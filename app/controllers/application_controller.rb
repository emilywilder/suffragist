class ApplicationController < Sinatra::Base

    configure do
      set :views, 'app/views'
      set :database_file, 'config/database.yml'
    end

    get '/' do
      @title = 'Welcome to the Suffragist!'
      erb :index
    end

    post '/cast' do
      @title = 'Thanks for casting your vote!'
      @vote = params['vote']
      @store = YAML::Store.new 'votes.yml'
      @store.transaction do
        @store['votes'] ||= {}
        @store['votes'][@vote] ||= 0
        @store['votes'][@vote] += 1
      end
      erb :cast
    end

    get '/results' do
      @title = 'Results so far:'
      @store = YAML::Store.new 'votes.yml'
      @votes = @store.transaction { @store['votes'] }
      erb :results
    end

end
