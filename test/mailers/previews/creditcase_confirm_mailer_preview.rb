# Preview all emails at http://localhost:3000/rails/mailers/creditcase_confirm_mailer
class CreditcaseConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/creditcase_confirm_mailer/mail_content
  def mail_content
    CreditcaseConfirmMailer.mail_content
  end

end
