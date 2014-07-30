class ReplyApplierMailer < ActionMailer::Base
  default from: "service@e-loan.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reply_applier_mailer.mail_content.subject
  #
  def mail_content(loan_case_id)
    @loan_case = LoanCase.find(loan_case_id)

    mail to: @loan_case.applicant_email, subject: "e貸宗師諮詢回覆[房貸][#{@loan_case.address}]"
  end
end
