class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    # Find user that already exists by provider and uid
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      # Find user that already exists by email
      user = User.where(email: auth.info.email).first
      unless user
        # User doesn't exist so create a new user
        logger.info auth.to_json
        user = User.create(
            uid: auth.uid,
            first_name: auth.extra.raw_info.first_name,
            last_name: auth.extra.raw_info.last_name,
            name: auth.extra.raw_info.name,
            email: auth.info.email,
            password: Devise.friendly_token[0, 20],
            provider: auth.provider)
        logger.info("Creating New User: #{user.to_json}")
      end
    end
    user
  end


end
