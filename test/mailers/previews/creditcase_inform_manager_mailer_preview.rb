# Preview all emails at http://localhost:3000/rails/mailers/creditcase_inform_manager_mailer
class CreditcaseInformManagerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/creditcase_inform_manager_mailer/mail_content
  def mail_content
    CreditcaseInformManagerMailer.mail_content
  end

end
