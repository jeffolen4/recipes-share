class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

   def self.from_omniauth(auth)
     #raise " from User model, Auth: #{auth.inspect}"
     User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider != 'twitter'
        user.email = auth.info.email
      else
        user.email = auth.uid + '@twitter.com'
      end

      user.password = Devise.friendly_token[0,20]
    end
  end

end
