# Preview all emails at http://localhost:3000/rails/mailers/onlending_inform_manager_mailer
class OnlendingInformManagerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/onlending_inform_manager_mailer/mail_content
  def mail_content
    OnlendingInformManagerMailer.mail_content
  end

end
