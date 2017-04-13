# Type020FooMailer.activation_mail(Type020EmailActivation.first).deliver_now
# Type020FooMailer.welcome_mail(Type020User.first).deliver_now

class Type020FooMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.type020_foo_mailer.activation_mail.subject
  #
  def type020_user_created_mail(type020_user)
    @type020_user = type020_user
    mail to: type020_user.email, :subject => "ユーザー登録完了"
  end

  def type020_user_password_update(type020_user)
    @type020_user = type020_user
    mail to: type020_user.email, :subject => "ユーザーパスワード変更"
  end
end
