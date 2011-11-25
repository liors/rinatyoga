require "mongoid"

class Note
  include Mongoid::Document
  field :line1
  field :line2  
end