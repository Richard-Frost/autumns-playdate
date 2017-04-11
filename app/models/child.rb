class Child < ActiveRecord::Base
  belongs_to :parents
  has_many :relationships
  has_many :parents, through: :relationships
  has_many :playdate
end