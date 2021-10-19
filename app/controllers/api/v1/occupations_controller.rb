class Api::V1::OccupationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_occupation, only: [:show, :update, :destroy]

  # GET /occupations
  def index
    @occupations = Occupation.all

    render json: @occupations
  end

  # GET /occupations/1
  def show
    render json: @occupation
  end

  # POST /occupations
  def create
    @occupation = Occupation.new(occupation_params)

    if @occupation.save
      render json: @occupation, status: :created, location: @occupation
    else
      render json: @occupation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /occupations/1
  def update
    if @occupation.update(occupation_params)
      render json: @occupation
    else
      render json: @occupation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /occupations/1
  def destroy
    @occupation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupation
      @occupation = Occupation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occupation_params
      params.require(:occupation).permit(:name, :salary, :department_id)
    end
end
