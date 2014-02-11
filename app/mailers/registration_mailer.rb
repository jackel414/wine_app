class RegistrationMailer < ActionMailer::Base
  default from: "zack@wineapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.registration_email.subject
  #
  def registration_email(user)
	@user = user
    @greeting = "Hi"

    mail to: 'zackmays@gmail.com', subject: 'Test Mail'
  end
end
