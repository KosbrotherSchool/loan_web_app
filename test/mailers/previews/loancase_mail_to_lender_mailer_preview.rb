# Preview all emails at http://localhost:3000/rails/mailers/loancase_mail_to_lender_mailer
class LoancaseMailToLenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loancase_mail_to_lender_mailer/mail_content
  def mail_content
    LoancaseMailToLenderMailer.mail_content
  end

end
