# Preview all emails at http://localhost:3000/rails/mailers/loancase_reply_applier_mailer
class LoancaseReplyApplierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loancase_reply_applier_mailer/mail_content
  def mail_content
    LoancaseReplyApplierMailer.mail_content
  end

end
