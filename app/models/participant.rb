class Participant < ActiveRecord::Base
  
  belongs_to :playdate
  belongs_to :child
  belongs_to :parent

end 