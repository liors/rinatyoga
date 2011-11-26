require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongoid'
require 'model/note'
require './main'

run Sinatra::Application
