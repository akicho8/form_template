# Type018FooMailer.activation_mail(Type018EmailActivation.first).deliver_now
# Type018FooMailer.welcome_mail(Type018User.first).deliver_now

class Type018FooMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.type018_foo_mailer.activation_mail.subject
  #
  def activation_mail(type018_email_activation)
    @type018_email_activation = type018_email_activation
    mail to: type018_email_activation.email, :subject => "メール認証"
  end

  def welcome_mail(user)
    @user = user
    mail to: user.email, :subject => "本登録が完了しました"
  end

  def password_reset_url_notice_mail(type018_password_reset_url_notification)
    @type018_password_reset_url_notification = type018_password_reset_url_notification
    mail to: type018_password_reset_url_notification.email, :subject => "パスワード変更"
  end

  def type018_password_reseter_mail(type018_password_reseter)
    @type018_password_reseter = type018_password_reseter
    mail to: type018_password_reseter.type018_user.email, :subject => "パスワードを再設定しました。"
  end
end
