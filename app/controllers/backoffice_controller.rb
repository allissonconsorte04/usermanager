class BackofficeController < ApplicationController
  before_action :authenticate_user!, :verify_role

  def import
    file = params[:file]
    importer = UserImporter.new(file: file.tempfile)
    importer.import!
    redirect_to backoffice_users_path, notice: 'Usuários importados com sucesso!'
  rescue StandardError => e
    redirect_to backoffice_users_path, alert: "Erro ao importar usuários: #{e.message}"
  end

  private

  def verify_role
    return if current_user.admin?

    redirect_to new_user_session_path
  end
end
