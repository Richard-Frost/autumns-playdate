class Child < ActiveRecord::Basete
  has_many :playdate
  belongs_to :parents
end