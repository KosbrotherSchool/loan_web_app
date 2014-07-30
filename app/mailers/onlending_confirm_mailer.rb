class OnlendingConfirmMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.onlending_confirm_mailer.mail_content.subject
  #
  def mail_content(onlending_id)
    @onlending = Onlending.find(onlending_id)
    mail to: @onlending.applicant_email, subject: "e貸宗師感謝您的申請[增轉貸][#{@onlending.address}]"
  end
end
