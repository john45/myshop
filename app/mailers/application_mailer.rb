class ApplicationMailer < ActionMailer::Base
  ADMIN_EMAIL = "postmaster@adamenko.pp.ua"
  default from: ADMIN_EMAIL
  layout 'mailer'
end
