class InformManamgerNewLenderMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inform_manamger_new_lender_mailer.mail_content.subject
  #
  def mail_content(lender_id)
    @lender = Lender.find(lender_id)

    mail to: "service@ezbank.com.tw", subject: "新專員申請~"
  end
end
