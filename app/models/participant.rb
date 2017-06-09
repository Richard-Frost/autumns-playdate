class Participant < ActiveRecord::Base

  #has_many :parents
  # has_many :playdates
  # has_many :children

  belongs_to :playdate
  belongs_to :child

 
end 