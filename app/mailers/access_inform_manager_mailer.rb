class AccessInformManagerMailer < ActionMailer::Base
  default from: "\"估屋網\" <service@goodwoo.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.access_inform_manager_mailer.mail_content.subject
  #
  def mail_content(access_id)
    @access = Access.find(access_id)
    mail to: "kosbrotherschool@gmail.com", subject: "新估價案件"
  end
end
