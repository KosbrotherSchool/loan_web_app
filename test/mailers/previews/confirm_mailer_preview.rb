# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_mailer/mail_content
  def mail_content
    ConfirmMailer.mail_content
  end

end
