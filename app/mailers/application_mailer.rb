class ApplicationMailer < ActionMailer::Base
  default from: "alice@localhost"
  layout "mailer"

  # ApplicationMailer.test_mail.deliver_now
  def test_mail
    mail(from: "pinpon.ikeda@gmail.com", to: "pinpon.ikeda@gmail.com", body: Time.current.to_s, subject: "test_mail")
  end
end
