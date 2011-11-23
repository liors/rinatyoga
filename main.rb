require 'rubygems'
require 'sinatra'

get '/' do 
  #send_file 'index.html'
  haml :index
end

not_found do
    'This is nowhere to be found.'
end
