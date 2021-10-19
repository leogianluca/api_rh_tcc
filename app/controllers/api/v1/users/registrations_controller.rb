class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    super
  end

  def resource_name
    :user
  end

  private
    def respond_with(resource, _opts = {})
      sign_in(resource_name, resource) && register_success(resource) && return if resource.persisted?

      register_failed(resource.errors.messages)
    end

    def register_success(user)
      token = user.generate_jwt
      response.set_header('Authorization', "Bearer #{token}")
      render json: {message: 'Usuário cadastrado com sucesso', token: token}, status: :created
    end

    def register_failed(messages)
      render json: { errors: messages }, status: :unprocessable_entity
    end
end