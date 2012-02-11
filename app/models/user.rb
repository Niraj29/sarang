class User < ActiveRecord::Base
	has_many :subdomains, :dependent => :destroy
	has_many :propers, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  validates_uniqueness_of :company_name, :email, :case_sensitive => false
  attr_accessible :company_name, :contact_person, :contact_no, :sales_team_contact, :agent_type, :email, :password, :password_confirmation, :remember_me
end
