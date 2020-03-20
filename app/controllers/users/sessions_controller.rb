# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    user_params = params.require(:user).permit(:email, :password)

    resource = User.find_for_database_authentication(user_params.slice(:email))
    if resource&.valid_password?(user_params[:password])
      sign_in :user, resource
      return render json: { success: true }
    end

    render json: { success: false }, status: :unauthorized
  end
end
