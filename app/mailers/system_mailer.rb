class SystemMailer < ApplicationMailer
  def ping(to:)
    mail(to:, subject: "The Giving Guide mail test", body: "If you got this, SMTP via SES works 🎉")
  end
end
