class MailToLenderMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_to_lender_mailer.mail_content.subject
  #
  def mail_content(case_id, lender_id)
    @loan_case = LoanCase.find(case_id)
    @lender = Lender.find(lender_id)
    mail to: @lender.email, subject: "e貸宗師案件媒合"
  end
end
