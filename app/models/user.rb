class User < ActiveRecord::Base
  # attr_accessor :email, :name, :password, :password_confirmation
  has_secure_password
end
