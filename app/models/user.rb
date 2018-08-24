# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter github]

  mount_uploader :avatar, AvatarUploader
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] &&
                session['devise.facebook_data']['extra']['raw_info']
        users.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
    end
  end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end
end
