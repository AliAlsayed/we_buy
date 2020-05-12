class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("SMTP_DEFAUL_FROM")
  layout 'mailer'
end
