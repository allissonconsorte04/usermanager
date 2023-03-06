class BackofficeController < ApplicationController
  before_action :authenticate_user!, :verify_role

  private

  def verify_role
    return if current_user.admin?

    redirect_to new_user_session_path
  end
end
