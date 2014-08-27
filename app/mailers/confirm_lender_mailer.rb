class ConfirmLenderMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_lender_mailer.mail_content.subject
  #
  def mail_content(lender_id)
    @lender = Lender.find(lender_id)
    mail to: @lender.email, subject: "EZBANK感謝您的加入"
  end
end
