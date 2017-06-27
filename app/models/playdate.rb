class Playdate < ActiveRecord::Base

  has_many :participants  
  has_many :children, through: :participants
  has_many :parents, through: :participants
  has_many :comments

  validates :name, presence: true
  validates :location, presence: true
  
  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Playdate.all.find{|playdate| playdate.slug == slug}
  end
end

