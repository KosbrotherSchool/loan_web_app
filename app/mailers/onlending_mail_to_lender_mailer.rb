class OnlendingMailToLenderMailer < ActionMailer::Base
  default from: "service@ezbank.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.onlending_mail_to_lender_mailer.mail_content.subject
  #
  def mail_content(onlending_id, lender_id)
    @onlending = Onlending.find(onlending_id)
    @lender = Lender.find(lender_id)
    
    @key = "+"
    while @key.index("+")
      @key = AES.encrypt(@lender.id.to_s, ENV["KEY"])
    end

    @token = "+"
    while @token.index("+")
      @token = AES.encrypt(@onlending.id.to_s, ENV["KEY"])
    end

    mail to: @lender.email, subject: "[EZBANK-增轉貸][#{@onlending.address}]"
  end
end
