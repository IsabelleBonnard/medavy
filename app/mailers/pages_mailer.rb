class PagesMailer < ApplicationMailer
  def contact_mail(name_contact, email_contact, message_contact)
    @name_contact = name_contact
    @email_contact = email_contact
    @message_contact = message_contact
    mail(to: "isabelle.charon@gmail.com", subject: t('pages_mailer.contact_mail.subject', name_contact: @name_contact))
  end
end
