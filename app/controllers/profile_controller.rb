class ProfileController < ActionController::Base
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(profile_params.compact_blank)
      redirect_to profile_index_path, notice: 'Perfil atualizado com sucesso!'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :role, :remove_avatar,
                                 :password_confirmation)
  end
end
