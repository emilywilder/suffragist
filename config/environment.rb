require 'require_all'
require 'sinatra/activerecord'
require 'thin'
require 'sqlite3'
require 'rake'
require 'pry'
require 'byebug'

require_all 'app'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database =>  'suffragist.db'
)
