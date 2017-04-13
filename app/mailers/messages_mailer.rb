class MessagesMailer < ApplicationMailer
  def contact_mail(message)
    @name = message.name
    @email = message.email
    @content = message.content
    mail(to: "contact.medavy@gmail.com", subject: t('messages.subject', name: @name))
  end
end
