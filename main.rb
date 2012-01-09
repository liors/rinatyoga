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
  @schedule = getSchedule()
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

get '/rinat' do
  @note = getNote()
  haml :rinat
end

get '/admin' do
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['rinat', 'aluma']
  end
  @note = getNote()
  @schedule = getSchedule()
  haml :admin
end

post '/admin/notes' do
  @note = getNote()
  @note.header = params[:header]
  @note.body = params[:body]
  if @note.update 
    redirect '/admin'
  else
    puts "Error(s): ", @note.errors.map {|k,v| "#{k}: #{v}"}
  end
end

post '/admin/schedule' do
  schedule = getSchedule()
  schedule.sunday_1 = params[:sunday_1]
  schedule.sunday_2 = params[:sunday_2]
  schedule.sunday_3 = params[:sunday_3]
  schedule.sunday_4 = params[:sunday_4]
  schedule.sunday_5 = params[:sunday_5]
  schedule.monday_1 = params[:monday_1]
  schedule.monday_2 = params[:monday_2]
  schedule.monday_3 = params[:monday_3]
  schedule.monday_4 = params[:monday_4]
  schedule.monday_5 = params[:monday_5]
  schedule.tuesday_1 = params[:tuesday_1]
  schedule.tuesday_2 = params[:tuesday_2]
  schedule.tuesday_3 = params[:tuesday_3]
  schedule.tuesday_4 = params[:tuesday_4]
  schedule.tuesday_5 = params[:tuesday_5]
  schedule.wednesday_1 = params[:wednesday_1]
  schedule.wednesday_2 = params[:wednesday_2]
  schedule.wednesday_3 = params[:wednesday_3]
  schedule.wednesday_4 = params[:wednesday_4]
  schedule.wednesday_5 = params[:wednesday_5]
  schedule.thursday_1 = params[:thursday_1]
  schedule.thursday_2 = params[:thursday_2]
  schedule.thursday_3 = params[:thursday_3]
  schedule.thursday_4 = params[:thursday_4]
  schedule.thursday_5 = params[:thursday_5]
  schedule.friday_1 = params[:friday_1]
  schedule.friday_2 = params[:friday_2]
  schedule.friday_3 = params[:friday_3]
  schedule.friday_4 = params[:friday_4]
  schedule.friday_5 = params[:friday_5]
  if schedule.update
    redirect '/admin'
  else
    puts "Error(s): ", schedule.errors.map {|k,v| "#{k}: #{v}"}
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

def getSchedule
  return Schedule.all_in().limit(1)[0]
end

class Note
  include Mongoid::Document
  field :header, :type => String
  field :body, :type => String
end

class Schedule
  include Mongoid::Document
  field :sunday_1, :type => String
  field :sunday_2, :type => String
  field :sunday_3, :type => String
  field :sunday_4, :type => String
  field :sunday_5, :type => String
  field :monday_1, :type => String
  field :monday_2, :type => String
  field :monday_3, :type => String
  field :monday_4, :type => String
  field :monday_5, :type => String
  field :tuesday_1, :type => String
  field :tuesday_2, :type => String
  field :tuesday_3, :type => String
  field :tuesday_4, :type => String
  field :tuesday_5, :type => String
  field :wednesday_1, :type => String
  field :wednesday_2, :type => String
  field :wednesday_3, :type => String
  field :wednesday_4, :type => String
  field :wednesday_5, :type => String
  field :thursday_1, :type => String
  field :thursday_2, :type => String
  field :thursday_3, :type => String
  field :thursday_4, :type => String
  field :thursday_5, :type => String
  field :friday_1, :type => String
  field :friday_2, :type => String
  field :friday_3, :type => String
  field :friday_4, :type => String
  field :friday_5, :type => String
end

not_found do
    'This is nowhere to be found.'
end