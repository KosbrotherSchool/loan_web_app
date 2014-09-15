class CreditcaseInformManagerMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.creditcase_inform_manager_mailer.mail_content.subject
  #
  def mail_content(credit_case_id)
    @credit_case = CreditCase.find(credit_case_id)
    mail to: "\"EZBANK\" <service@ezbank.com.tw>", subject: "新信貸申請"
  end
end
