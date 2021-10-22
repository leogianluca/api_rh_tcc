class Api::V1::WorkersController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :set_worker, only: [:show, :update, :destroy]

  # GET /workers
  def index
    @workers = Worker.all
    render json: @workers, status: 200
  end

  # GET /workers/1
  def show
    render json: @worker, status: 200
  end

  # POST /workers
  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      render json: @worker, status: :created
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1
  def update
    if @worker.update(worker_params)
      render json: @worker, status: 200
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workers/1 - Analisar se o registro de um funcionario poderá ser removido
  # def destroy
  #   @worker.destroy
  #   render json: { message: 'Trabalhador removido com sucesso!', status: 200  }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_params
      params.require(:worker).permit(:document, :full_name,
        :birthday, :identifier, :role_id, type: "Worker::Pf")
    end
end
