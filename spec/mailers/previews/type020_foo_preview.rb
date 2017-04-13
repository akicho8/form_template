# Preview all emails at http://localhost:3000/rails/mailers/type020_foo
class Type020FooPreview < ActionMailer::Preview
  def type020_user_created_mail
    Type020FooMailer.type020_user_created_mail(Type020User.first)
  end

  def type020_user_password_update
    Type020FooMailer.type020_user_password_update(Type020User.first)
  end
end
