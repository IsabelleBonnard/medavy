class ApplicationMailer < ActionMailer::Base
  default from: 'contact.medavy@zadl.fr'
  layout 'mailer'
  add_template_helper(EmailHelper)
end
