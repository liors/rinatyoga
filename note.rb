require "mongoid"

class Note
  include Mongoid::Document
  field :header, :type => String
  field :body, :type => String  
end