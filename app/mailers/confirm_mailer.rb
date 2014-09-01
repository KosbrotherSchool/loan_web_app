class ConfirmMailer < ActionMailer::Base
  default from: "\"EZBANK\" <service@ezbank.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.mail_content.subject
  #   ConfirmMailer.mail_content(30).deliver
  #
  def mail_content(case_id)
    @loan_case = LoanCase.find(case_id)
    mail to: "\"#{@loan_case.applicant_name}\" <#{@loan_case.applicant_email}>", subject: "EZBANK感謝您的申請[房貸][#{@loan_case.address}]"
  end
end
