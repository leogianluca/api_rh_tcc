class Api::V1::ContractWorkersController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_contract_worker, only: [:show, :update, :destroy]

  # GET /contract_workers
  def index
    @contract_workers = ContractWorker.all
    render json: @contract_workers, status: 200
  end

  # GET /contract_workers/1
  def show
    render json: @contract_worker, status: 200
  end

  # POST /contract_workers
  def create
    @contract_worker = ContractWorker.new(contract_worker_params)

    if @contract_worker.save
      render json: @contract_worker, status: :created
    else
      render json: @contract_worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contract_workers/1
  def update
    if @contract_worker.update(contract_worker_params)
      render json: @contract_worker, status: 200
    else
      render json: @contract_worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contract_workers/1
  def destroy
    @contract_worker.destroy
    render json: { message: 'Contrato removido com sucesso!', status: 200  }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_worker
      @contract_worker = ContractWorker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contract_worker_params
      params.fetch(:contract_worker).require(:identifier, :description, :estimated_hours)
    end
end
