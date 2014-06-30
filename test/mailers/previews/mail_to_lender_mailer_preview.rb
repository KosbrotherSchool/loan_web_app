# Preview all emails at http://localhost:3000/rails/mailers/mail_to_lender_mailer
class MailToLenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_to_lender_mailer/mail_content
  def mail_content
    MailToLenderMailer.mail_content
  end

end
