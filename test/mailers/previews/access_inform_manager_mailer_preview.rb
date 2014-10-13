# Preview all emails at http://localhost:3000/rails/mailers/access_inform_manager_mailer
class AccessInformManagerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/access_inform_manager_mailer/mail_content
  def mail_content
    AccessInformManagerMailer.mail_content
  end

end
