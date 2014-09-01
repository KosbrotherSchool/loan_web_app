# Preview all emails at http://localhost:3000/rails/mailers/loancase_confirm_mailer
class LoancaseConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loancase_confirm_mailer/mail_content
  def mail_content
    LoancaseConfirmMailer.mail_content
  end

end
