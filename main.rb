require 'rubygems'
require 'sinatra'

get '/' do 
  #send_file 'index.html'
  haml :index
end
