require 'rubygems'
require 'mongoid'
require 'sinatra'
require 'model/note'

configure :development do
    Mongoid.configure do |config|
      name = 'emails_database'
      config.master = Mongo::Connection.new.db(name)
    end
end

configure :production do
    Mongoid.configure do |config|
      name = 'app998473'
      config.master = Mongo::Connection.from_uri(ENV['MONGOHQ_URL']).db(name)
    end
end



get '/' do
  @note = Note.all_in().limit(1)[0]
  haml :index
end

get '/schedule' do
  haml :schedule
end

not_found do
    'This is nowhere to be found.'
end
