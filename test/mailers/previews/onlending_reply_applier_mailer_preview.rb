# Preview all emails at http://localhost:3000/rails/mailers/onlending_reply_applier_mailer
class OnlendingReplyApplierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/onlending_reply_applier_mailer/mail_content
  def mail_content
    OnlendingReplyApplierMailer.mail_content
  end

end
