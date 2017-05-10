class ApplicationMailer < ActionMailer::Base
  default from: 'contact@zadl.fr'
  layout 'mailer'
  add_template_helper(EmailHelper)
end
