class Subdomain < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name

end
