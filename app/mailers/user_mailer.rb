class UserMailer < ActionMailer::Base
  default from: "honey@cando.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"
    mail to: @user.email, subject: "Sign up Confirmation"
  end
end
