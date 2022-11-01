require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations' do

    context 'when create an invalid user' do
      let(:user) { User.new }

      it 'with empty attributes' do
        expect(user.email).to be_empty
        expect(user.password).to be_nil
        expect(user.password_confirmation).to be_nil
        expect(user).not_to be_valid
      end

    end

    context 'when create a valid user' do
      let(:user) { User.new(email: "fulano@teste.com", password: "123456", password_confirmation: "123456") }
      let!(:created_user) { User.create!(email: "cicrano@teste.com", password: "123456", password_confirmation: "123456") }

      it 'with attributes filled' do
        expect(user).to be_valid
      end

      it 'with valid password and password_confirmation' do
        expect(user.password).not_to be_empty
        expect(user.password_confirmation).not_to be_empty
        expect(user.password).to eq(user.password_confirmation)
      end

      it 'with existing email' do
        expect{
            User.create!(email: "cicrano@teste.com", password: "123456", password_confirmation: "123456")
        }.to raise_error(ActiveRecord::RecordInvalid, "A validação falhou: E-mail já está em uso")
      end
    end

  end

  context 'associations' do
    it { is_expected.to have_one(:company)}
  end

end
