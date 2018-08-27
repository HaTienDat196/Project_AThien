# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :username }
  end

  describe 'db schema' do
    context 'columns' do
      it { is_expected.to have_db_column(:email).of_type :string }
      it { is_expected.to have_db_column(:username).of_type :string }
      it { is_expected.to have_db_column(:birth).of_type :date }
      it { is_expected.to have_db_column(:avatar).of_type :string }
      it { is_expected.to have_db_column(:encrypted_password).of_type :string }
      it { is_expected.to have_db_column(:reset_password_token).of_type :string }
      it { is_expected.to have_db_column(:reset_password_sent_at).of_type :datetime }
      it { is_expected.to have_db_column(:remember_created_at).of_type :datetime }
      it { is_expected.to have_db_column(:created_at).of_type :datetime }
      it { is_expected.to have_db_column(:updated_at).of_type :datetime }
      it { is_expected.to have_db_column(:admin).of_type :boolean }
      it { is_expected.to have_db_column(:provider).of_type :string }
      it { is_expected.to have_db_column(:uid).of_type :string }
    end
  end
end
