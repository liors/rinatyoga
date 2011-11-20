require "mongoid"

class Email
  include Mongoid::Document
  field :email
end