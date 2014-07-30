# Preview all emails at http://localhost:3000/rails/mailers/onlending_confirm_mailer
class OnlendingConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/onlending_confirm_mailer/mail_content
  def mail_content
    OnlendingConfirmMailer.mail_content
  end

end
