# Preview all emails at http://localhost:3000/rails/mailers/loancase_infom_manager_mailer
class LoancaseInfomManagerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loancase_infom_manager_mailer/mail_content
  def mail_content
    LoancaseInfomManagerMailer.mail_content
  end

end
