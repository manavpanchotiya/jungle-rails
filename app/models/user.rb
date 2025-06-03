class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :password, length: { minimum: 8 }

  before_save :downcase_email

  def self.authenticate_with_credentials(email, password)
    normalized_email = email.strip.downcase
    user = User.find_by(email: normalized_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
