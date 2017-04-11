class MailTest001Mailer < ApplicationMailer
  # ApplicationMailer.test_mail1.deliver_now
  def test_mail1
    mail(to: "pinpon.ikeda@gmail.com", subject: "テンプレートを使わないメール例", body: Time.current.to_s)
  end

  # ApplicationMailer.test_mail2.deliver_now
  def test_mail2
    attachments.inline["0120_kemono_friends.jpg"] = File.read(Rails.root.join("app/assets/images/0120_kemono_friends.jpg"))
    attachments["0110_kemono_friends.jpg"]        = File.read(Rails.root.join("app/assets/images/0110_kemono_friends.jpg"))
    attachments["example.csv"]                    = File.read(Rails.root.join("app/assets/example.csv"))
    mail(to: "pinpon.ikeda@gmail.com", subject: "インライン画像のメール例")
  end
end
