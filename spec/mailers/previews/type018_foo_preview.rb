# Preview all emails at http://localhost:3000/rails/mailers/type018_foo
class Type018FooPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/type018_foo/activation_mail
  def activation_mail
    Type018FooMailer.activation_mail(Type018EmailActivation.first)
  end

  def welcome_mail
    Type018FooMailer.welcome_mail(Type018User.first)
  end

  def password_reset_url_notice_mail
    Type018FooMailer.password_reset_url_notice_mail(Type018PasswordResetUrlNotification.first)
  end

  def type018_password_reseter_mail
    Type018FooMailer.type018_password_reseter_mail(Type018PasswordReseter.first)
  end
end
