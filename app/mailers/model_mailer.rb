class ModelMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.mail_content.subject
  #   ModelMailer.mail_content.deliver

  def mail_content(email)
    @greeting = "Hi"

    mail to: email, subject: "Success! You did it."
  end
end
