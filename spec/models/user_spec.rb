require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(email: "user@example.email", password: "123456", password_confirmation: "123456") }

  context 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

end
