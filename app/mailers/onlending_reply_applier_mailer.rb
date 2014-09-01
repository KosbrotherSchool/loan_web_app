class OnlendingReplyApplierMailer < ActionMailer::Base
  default from: "\"EZBANK\" <service@ezbank.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.onlending_reply_applier_mailer.mail_content.subject
  #
  def mail_content(onlending_id)
    @onlending = Onlending.find(onlending_id)
    mail to: "\"#{@onlending.applicant_name}\" <#{@onlending.applicant_email}>", subject: "EZBANK諮詢回覆[增轉貸][#{@onlending.address}]"
  end
end
