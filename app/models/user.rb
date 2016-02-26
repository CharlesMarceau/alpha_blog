class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase } #ajuster toutes les lettres en miniscule avant de saver
  validates :username, presence: true,
                       uniqueness: true,
                       length: { minimum: 3, maximum: 25 } # active_record_validations.html
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i # regular expression
  validates :email, presence: true, 
                    uniqueness: true,
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end