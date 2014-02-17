class RegistrationMailer < ActionMailer::Base
  default from: "zack@wineapp.com"
  
  def registration_email(user)
	@user = user
	@url = 'http://www.flyingvines.com'
    mail to: @user.email, subject: 'Welcome!', from: 'Wino Log <zack@wineapp.com>', bcc: 'zackmays@gmail.com'
  end
end
