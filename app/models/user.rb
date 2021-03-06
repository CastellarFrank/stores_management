class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :full_name
  has_secure_password
end
