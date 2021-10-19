class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])
  
    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      response.set_header('Authorization', "Bearer #{token}")

      sign_in(:user, user)
      render json: {message: 'Log-In efetuado com sucesso.', token: token}, status: :created
    else
      render json: { errors: { 'email ou senha' => ['inválido'] } }, status: :unprocessable_entity
    end
  end
  
  private
    def sign_in_params
      params.require(:user)
    end

    # def respond_with(resource, _opts = {})
    #   # super(resource, _opts)
    #   # render json: { message: 'Você já está logado.' }, status: :ok
    # end

    def respond_to_on_destroy
      log_out_success && return if current_user
      log_out_failure
    end

    def log_out_success
      render json: { message: "Sussão finalizada." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Nada aconteceu."}, status: :unauthorized
    end
end