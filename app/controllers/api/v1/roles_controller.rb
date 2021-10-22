class Api::V1::RolesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all
    render json: @roles, status: 200
  end

  # GET /roles/1
  def show
    render json: @role, status: 200
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      render json: @role, status: :created
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      render json: @role, status: 200
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    render json: { message: 'Função removida com sucesso!', status: 200  }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name, :description, :occupation_id)
    end
end
