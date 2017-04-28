class Parent < ActiveRecord::Base

  has_secure_password
  
  has_many :relationships
  has_many :children, through: :relationships
  has_many :playdate, through: :child

 validates :name, presence: true
 validates :email, uniqueness: true
end