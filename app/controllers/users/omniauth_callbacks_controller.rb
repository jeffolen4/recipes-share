class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter

    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

  def facebook

    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    raise request.env["omniauth.auth"].inspect
    super
  end

  #alias_method :facebook, :all
	#alias_method :twitter, :all
	#alias_method :linkedin, :all
	#alias_method :github, :all
	#alias_method :passthru, :all
	#alias_method :google_oauth2, :all

end
