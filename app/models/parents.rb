class Parents < ActiveRecord::Base
  has_many :child
  has_many :playdate, through: :child
end