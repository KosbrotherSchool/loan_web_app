class ConfirmMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.mail_content.subject
  #   ConfirmMailer.mail_content("kosbrotherschool@gmail.com",30).deliver
  #
  def mail_content(email, case_id)
    @loan_case = LoanCase.find(case_id)

    mail to: email, subject: "e貸宗師感謝您的申請~"
  end
end
