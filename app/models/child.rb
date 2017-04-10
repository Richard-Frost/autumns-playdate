class Child < ActiveRecord::Base
  belongs_to :parents
  has_many :playdate
end