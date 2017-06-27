class Checkin < ActiveRecord::Base
  
  belongs_to :location
  belongs_to :child
  validates :child_id, uniqueness: true

end
