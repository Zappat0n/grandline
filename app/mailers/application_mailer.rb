class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(ENV["ADMIN_EMAIL"], ENV["ADMIN_NAME"])
  layout "mailer"
end
