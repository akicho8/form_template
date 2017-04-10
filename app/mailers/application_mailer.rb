class ApplicationMailer < ActionMailer::Base
  default from: "alice@localhost"
  layout "mailer"
end
