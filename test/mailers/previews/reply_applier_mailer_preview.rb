# Preview all emails at http://localhost:3000/rails/mailers/reply_applier_mailer
class ReplyApplierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reply_applier_mailer/mail_content
  def mail_content
    ReplyApplierMailer.mail_content
  end

end
