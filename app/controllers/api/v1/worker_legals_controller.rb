class Api::V1::WorkerLegalsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_worker_legal, only: [:show, :update, :destroy]

  # GET /worker_legals
  def index
    @worker_legals = WorkerLegal.all
    render json: @worker_legals, status: 200
  end

  # GET /worker_legals/1
  def show
    render json: @worker_legal, status: 200
  end

  # POST /worker_legals
  def create
    @worker_legal = WorkerLegal.new(worker_legal_params)

    if @worker_legal.save
      render json: @worker_legal, status: :created
    else
      render json: @worker_legal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /worker_legals/1
  def update
    if @worker_legal.update(worker_legal_params)
      render json: @worker_legal, status: 200
    else
      render json: @worker_legal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /worker_legals/1
  # def destroy
    # @worker_legal.destroy
    # render json: { message: 'Funcionario por contrato removido com sucesso!', status: 200  }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker_legal
      @worker_legal = WorkerLegal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_legal_params
      params.require(:worker_legal).permit(:document, :social_name,
        :opened_date, :role_id, :contract_worker, type: "Worker::Pj")
    end
end
