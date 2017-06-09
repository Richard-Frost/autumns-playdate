class Playdate < ActiveRecord::Base

  has_many :participants  
  has_many :children, through: :participants
  has_many :comments
  
  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Playdate.all.find{|playdate| playdate.slug == slug}
  end
end

