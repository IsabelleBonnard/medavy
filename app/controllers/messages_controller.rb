class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    MessagesMailer.contact_mail(@message).deliver_now
    flash[:notice] = t('messages.notification')
    redirect_to root_path
  end

  def message_params
    params.require(:message).permit(:content, :email, :name)
  end
end
