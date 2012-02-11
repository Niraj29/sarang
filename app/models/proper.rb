class Proper < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo
end
