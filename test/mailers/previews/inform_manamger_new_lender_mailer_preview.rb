# Preview all emails at http://localhost:3000/rails/mailers/inform_manamger_new_lender_mailer
class InformManamgerNewLenderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inform_manamger_new_lender_mailer/mail_content
  def mail_content
    InformManamgerNewLenderMailer.mail_content
  end

end
