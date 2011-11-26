require "mongoid"

class Note
  include Mongoid::Document
  field :header
  field :body  
end