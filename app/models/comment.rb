class Comment < ActiveRecord::Base

  belongs_to :playdate
  belongs_to :parent

end