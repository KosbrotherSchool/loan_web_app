class LoancaseInfomManagerMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.mail_content.subject
  #   ConfirmMailer.mail_content(30).deliver
  #
  def mail_content(case_id)
    @loan_case = LoanCase.find(case_id)
    mail to: "\"EZBANK\" <service@ezbank.com.tw>", subject: "新案件申請[房貸][#{@loan_case.address}]"
  end
end
