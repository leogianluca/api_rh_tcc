class Api::V1::Users::PasswordsController < Devise::PasswordsController
  respond_to :json

  def create
    user = User.find_by_email(params[:email])

    if user
      user.send_password_reset
    else
      render json: {message: "Usuário não encontrado"}, status: :unprocessable_entity
    end
  end
end
