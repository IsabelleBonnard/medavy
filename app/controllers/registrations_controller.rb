class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:edit, :update]

  def create
    session[:new_event_name] = params[:user][:new_event_name]
    super
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "Votre profil a bien été mis à jour !"
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birthday, :country_of_residence, :nationality, :photo, :photo_cache)
  end

end
