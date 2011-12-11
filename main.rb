require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'haml'

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
  @note = getNote()
  haml :index
end

get '/schedule' do
  @note = getNote()
  haml :schedule
end

get '/about' do
  @note = getNote()
  haml :about
end

get '/map' do
  @note = getNote
  haml :map
end

get '/news' do
  @note = getNote
  haml :news
end

get '/gallery' do
  @note = getNote
  haml :gallery
end

get '/admin' do
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['rinat', 'aluma']
  end
  @note = getNote()
  haml :admin
end

post '/admin/notes' do
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['rinat', 'aluma']
  end
  @note = getNote()
  @note.header = params[:header]
  @note.body = params[:body]
  if @note.update 
    redirect '/admin'
  else
    puts "Error(s): ", @note.errors.map {|k,v| "#{k}: #{v}"}
  end
end

def getNote
  @note = session[:note]
  if @note.nil?
    @note = Note.all_in().limit(1)[0]
    session[:note] = @note
  end
  return @note
end


class Note
  include Mongoid::Document
  field :header, :type => String
  field :body, :type => String
end

not_found do
    'This is nowhere to be found.'
end