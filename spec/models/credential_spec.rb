require 'rails_helper'

RSpec.describe Credential, type: :model do
  it { should belong_to :financial_institution }
  it { should belong_to :user }
  it { should have_many :accounts }
  it { should validate_presence_of :encrypted_password }
  it { should validate_presence_of :encrypted_username }
  it { should validate_presence_of :financial_institution_id }
  it { should validate_presence_of :user_id }

  context 'when storing credentials' do
    before :each do
      @user = FactoryGirl.create(:user, password_digest: "this", created_at: DateTime.parse("2015-05-02"))
      @cred = FactoryGirl.create(:credential, user: @user)
    end

    it 'encrypts a given credential' do
      expect(@cred.encrypt_credential("some string", "passkey")).to_not be_blank
      expect(@cred.encrypt_credential("some string", "passkey")).to_not eq("some string")
    end

    it 'does not store the password in plain text' do
      password = "somepassword"
      passkey = "somepasskey"
      @cred.passkey = passkey
      @cred.password = password
      @cred.save
      @cred.reload
      expect(@cred.encrypted_password).to_not eq(password)
    end

    it 'does not store the username in plain text' do
      username = "someusername"
      passkey = "somepasskey"
      @cred.passkey = passkey
      @cred.username = username
      @cred.save
      @cred.reload
      expect(@cred.encrypted_username).to_not eq(username)
    end
  end
end
