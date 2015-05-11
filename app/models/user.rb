class User < ActiveRecord::Base
  has_secure_password
  before_create :ensure_authentication_token
  has_many :credentials
  has_many :accounts
  validates :email, uniqueness: true, presence: true

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    unless user && user.authenticate(password)
      return "Email or password invalid"
    end
    user
  end

  private

    def generate_authentication_token
      loop do
        token = SecureRandom.hex
        break token unless User.where(authentication_token: token).first
      end
    end
end
