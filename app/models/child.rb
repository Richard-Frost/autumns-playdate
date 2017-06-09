class Child < ActiveRecord::Base

  has_many :relationships
  has_many :parents, through: :relationships
  
  has_many :participants  
  has_many :playdates, through: :participants

  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Child.all.find{|child| child.slug == slug}
  end
  
end