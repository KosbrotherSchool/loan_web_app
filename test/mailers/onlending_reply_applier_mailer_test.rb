require 'test_helper'

class OnlendingReplyApplierMailerTest < ActionMailer::TestCase
  test "mail_content" do
    mail = OnlendingReplyApplierMailer.mail_content
    assert_equal "Mail content", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
