class LoancaseMailToLenderMailer < ActionMailer::Base
  default from: "\"EZBANK\" <service@ezbank.com.tw>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_to_lender_mailer.mail_content.subject
  #
  def mail_content(case_id, lender_id)
    @loan_case = LoanCase.find(case_id)
    @lender = Lender.find(lender_id)
    @key = "+"
    while @key.index("+")
      @key = AES.encrypt(@lender.id.to_s, ENV["KEY"])
    end
    @token = "+"
    while @token.index("+")
      @token = AES.encrypt(@loan_case.id.to_s, ENV["KEY"])
    end
    mail to: "\"#{@lender.name}\" <#{@lender.email}>", subject: "[EZBANK-新房貸][#{@loan_case.address}]"
  end
end
