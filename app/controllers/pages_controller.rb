class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :about, :history, :gallery, :exterior, :interiors, :medavy_by_night, :sky_views, :work, :send_contact_message]

  def home
  end

  def contact
  end

  def history
  end

  def gallery
  end

  def exterior
  end

  def interiors
  end

  def medavy_by_night
  end

  def sky_views
  end

  def work
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
