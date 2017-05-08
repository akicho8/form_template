# http://0.0.0.0:3000/rails/mailers/mail_test001
class MailTest001Preview < ActionMailer::Preview
  # http://0.0.0.0:3000/rails/mailers/mail_test001/test_mail1
  def test_mail1
    MailTest001Mailer.test_mail1
  end

  # http://0.0.0.0:3000/rails/mailers/mail_test001/test_mail2
  def test_mail2
    MailTest001Mailer.test_mail2
  end
end
