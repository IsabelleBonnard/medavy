class ApplicationMailer < ActionMailer::Base
  default from: 'isabelle.charon@gmail.com'
  layout 'mailer'
  add_template_helper(EmailHelper)
end
