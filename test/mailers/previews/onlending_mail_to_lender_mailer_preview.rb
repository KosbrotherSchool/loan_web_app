# Preview all emails at http://localhost:3000/rails/mailers/onlending_mail_to_lender_mailer
class OnlendingMailToLenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/onlending_mail_to_lender_mailer/mail_content
  def mail_content
    OnlendingMailToLenderMailer.mail_content
  end

end
