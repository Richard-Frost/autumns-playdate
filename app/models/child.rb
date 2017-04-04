class Child < ActiveRecord::Base
  has_many :playdate
  belongs_to :parents
end