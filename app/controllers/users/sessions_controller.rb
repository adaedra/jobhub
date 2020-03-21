# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :set_bundle

  def create
    user_params = params.require(:user).permit(:email, :password)

    resource = User.find_for_database_authentication(user_params.slice(:email))
    if resource&.valid_password?(user_params[:password])
      sign_in :user, resource
      return render json: { success: true, redirect_to: admin_openings_path }
    end

    render json: { success: false }, status: :unauthorized
  end

  private

  def set_bundle
    @layout_bundle = :login
  end
end
