require 'test_helper'

class SystemMailerTest < ActionMailer::TestCase
  test "new_account" do
    mail = SystemMailer.new_account
    assert_equal "New account", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contact_message" do
    mail = SystemMailer.contact_message
    assert_equal "Contact message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
