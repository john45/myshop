class ApplicationMailer < ActionMailer::Base
  default from: "postmaster@adamenko.pp.ua"
  layout 'mailer'
end
