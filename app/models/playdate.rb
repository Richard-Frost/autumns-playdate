class Playdate < ActiveRecord::Base
  belongs_to :child
  #belongs_to :parent, through: :child
end