class RegistrationMailer < ActionMailer::Base
  default from: "zack@wineapp.com"
  
  def registration_email(user)
	@user = user
    mail to: @user.email, subject: 'Sign Up Confirmation'
  end
end
