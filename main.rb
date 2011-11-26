require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'haml'
require 'model/note'

configure :development do
  Mongoid.configure do |config|
    name = 'emails_database'
    config.master = Mongo::Connection.new.db(name)
  end
  enable :sessions
end

configure :production do
  Mongoid.configure do |config|
    name = 'app998473'
    config.master = Mongo::Connection.from_uri(ENV['MONGOHQ_URL']).db(name)
  end
  enable :sessions  
end



get '/' do
  @note = Note.all_in().limit(1)[0]
  haml :index
end

get '/schedule' do
  haml :schedule
end

get '/admin' do
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['rinat', 'aluma']
  end
  @note = Note.all_in().limit(1)[0]
  session[:note] = @note
  haml :admin
end

post '/admin/notes' do
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['rinat', 'aluma']
  end
  @note = session[:note]
  @note.header = params[:header]
  @note.body = params[:body]
  if @note.update 
    redirect '/admin'
  else
    puts "Error(s): ", @note.errors.map {|k,v| "#{k}: #{v}"}
  end
end

not_found do
    'This is nowhere to be found.'
end