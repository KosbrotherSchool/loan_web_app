class LoancaseReplyApplierMailer < ActionMailer::Base
  default from: "\"EZBANK\" <service@ezbank.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reply_applier_mailer.mail_content.subject
  #
  def mail_content(loan_case_id)
    @loan_case = LoanCase.find(loan_case_id)
    mail to: "\"#{@loan_case.applicant_name}\" <#{@loan_case.applicant_email}>", subject: "EZBANK諮詢回覆[房貸][#{@loan_case.address}]"
  end
end
