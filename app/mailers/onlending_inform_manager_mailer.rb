class OnlendingInformManagerMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.onlending_confirm_mailer.mail_content.subject
  #
  def mail_content(onlending_id)
    @onlending = Onlending.find(onlending_id)
    mail to: "service@ezbank.com.tw", subject: "新案件申請[增轉貸][#{@onlending.address}]"
  end
end
