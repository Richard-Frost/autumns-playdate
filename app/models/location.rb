class Location < ActiveRecord::Base
  has_many :checkins
  has_many :children, through: :checkins

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Location.all.find{|location| location.slug == slug}
  end

  def checked_in?
    Location.checkin.all.include?{ |location| location.id }
  end

end