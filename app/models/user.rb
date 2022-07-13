
# rails g model password_digest
#   then in class has_secure_password
# this will run bcrypt
# will add passwor_confirmation
# make sure bcrypt is installed

# require 'valid_email'

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, email: true
end
