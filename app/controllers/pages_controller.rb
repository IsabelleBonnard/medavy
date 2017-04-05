class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :about, :send_contact_message]

  def home
  end

  def contact
  end

  def history
  end

  def send_contact_message
    @email_contact = params[:email_contact]
    @message_contact = params[:message_contact]
    @name_contact = params[:name_contact]
    PagesMailer.contact_mail(@name_contact, @email_contact, @message_contact).deliver_now
    flash[:notice] = t('pages.contact.notification')
    redirect_to root_path
  end
end
