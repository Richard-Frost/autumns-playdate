class Originator < ActiveRecord::Base
  has_many :parents
end