class CreditcaseConfirmMailer < ActionMailer::Base
  default from: "\"EZBANK\" <service@ezbank.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.creditcase_confirm_mailer.mail_content.subject
  #
  def mail_content(credit_case_id)
    @credit_case = CreditCase.find(credit_case_id)
    mail to: "\"#{@credit_case.applicant_name}\" <#{@credit_case.applicant_email}>", subject: "EZBANK感謝您的申請[信貸]"
  end
end
