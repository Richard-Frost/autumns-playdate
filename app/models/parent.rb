class Parent < ActiveRecord::Base

  has_secure_password
  
  has_many :relationships
  has_many :participants
  has_many :playdates, through: :participants
  has_many :children, through: :relationships
  has_many :comments
  belongs_to :participant

 validates :name, presence: true
 validates :email, uniqueness: true

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Parent.all.find{|parent| parent.slug == slug}
  end
  
end 