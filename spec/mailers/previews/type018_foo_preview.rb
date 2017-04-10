# Preview all emails at http://localhost:3000/rails/mailers/type018_foo
class Type018FooPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/type018_foo/activation_mail
  def activation_mail
    Type018FooMailer.activation_mail(Type018EmailActivation.first)
  end
end
