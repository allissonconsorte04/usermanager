module Backoffice
  class UsersController < BackofficeController
    before_action :user_params, only: [:create]

    def index
      @users = User.paginate(page: params[:page], per_page: 20)
      @total_users = User.count
      @admin_users = User.where(role: 'admin').count
      @regular_users = User.where(role: 'user').count
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to backoffice_users_path, notice: 'Usuário criado com sucesso!'
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
      @avatar_url = @user.avatar_url.present? ? @user.avatar_url : ''
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to backoffice_users_path, notice: 'Usuário atualizado com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to backoffice_users_path, notice: 'Usuário deletado com sucesso!'
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirm, :avatar, :role,
                                   :remove_avatar)
    end


  end
end
