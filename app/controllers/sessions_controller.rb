class SessionsController < Devise::SessionsController
  def create
    session[:new_event_name] = params[:user][:new_event_name]
    super
  end
end
