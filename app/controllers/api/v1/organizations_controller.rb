class Api::V1::OrganizationsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.all
    render json: @organizations, status: 200
  end

  # GET /organizations/1
  def show
    render json: @organization, status: 200
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    render json: { message: 'Organização removida com sucesso!', status: 200  }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:number, :district, :complement,
        :cep, :city, :uf, :opening_hours, :company_name, :trading_name, :document, :address)
    end
  end