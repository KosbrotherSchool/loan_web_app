# Preview all emails at http://localhost:3000/rails/mailers/confirm_lender_mailer
class ConfirmLenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_lender_mailer/mail_content
  def mail_content
    ConfirmLenderMailer.mail_content
  end

end
