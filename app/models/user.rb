class User < ApplicationRecord
	  has_secure_password
  #validates name, presence: true, length: {maximum: 50}
  #validates password_digest, presence: true, length: {minimum: 6}
  VALID_LOGIN_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates login, presence: true, length: {maximum: 260}, uniqueness: {case_sensitive: false}
  #before_save { self.login = login.downcase }
end
