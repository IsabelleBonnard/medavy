class ApplicationMailer < ActionMailer::Base
  default from: 'contact.medavy@gmail.com'
  layout 'mailer'
  add_template_helper(EmailHelper)
end
