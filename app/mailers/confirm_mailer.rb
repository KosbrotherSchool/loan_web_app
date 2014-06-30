class ConfirmMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.mail_content.subject
  #   ConfirmMailer.mail_content(30).deliver
  #
  def mail_content(case_id)
    @loan_case = LoanCase.find(case_id)
    mail to: @loan_case.applicant_email, subject: "e貸宗師感謝您的申請~"
  end
end
