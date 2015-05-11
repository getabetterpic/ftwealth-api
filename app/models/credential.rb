class Credential < ActiveRecord::Base
  belongs_to :financial_institution
  belongs_to :user
  has_many :accounts
  validates_presence_of :encrypted_password, :encrypted_username,
    :financial_institution_id, :user_id

  attr_accessor :passkey

  def password=(password)
    self.encrypted_password = self.encrypt_credential(password, passkey)
    return
  end

  def password
    decrypt(encrypted_password, passkey)
  end

  def username=(username)
    self.encrypted_username = self.encrypt_credential(username, passkey)
  end

  def username
    decrypt(encrypted_username, passkey)
  end

  def encrypt_credential(string, passkey)
    encrypt(string, passkey)
  end

  def request_account_info(passkey)
    userid = username(passkey)
    userpass = password(passkey)
    RequestOfx.request_acct_info(financial_institution, self.user, userid, userpass, self)
  end

  protected

    def encrypt(string, passkey)
      key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(passkey, self.user.password_digest.to_s, 20_000, 128)
      iv = OpenSSL::PKCS5.pbkdf2_hmac_sha1(passkey, self.user.created_at.to_s(:db), 10_000, 128)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = key
      cipher.iv = iv
      encrypted = cipher.update(string) + cipher.final
    end

    def decrypt(encrypted, passkey)
      key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(passkey, self.user.password_digest, 20_000, 128)
      iv = OpenSSL::PKCS5.pbkdf2_hmac_sha1(passkey, self.user.created_at.to_s(:db), 10_000, 128)
      decipher = OpenSSL::Cipher::AES256.new(:CBC)
      decipher.decrypt
      decipher.key = key
      decipher.iv = iv
      plain = decipher.update(encrypted) + decipher.final
    end
end
