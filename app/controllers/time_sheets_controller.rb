class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :update, :destroy]

  # GET /time_sheets
  def index
    @time_sheets = TimeSheet.all

    render json: @time_sheets
  end

  # GET /time_sheets/1
  def show
    render json: @time_sheet
  end

  # POST /time_sheets
  def create
    @time_sheet = TimeSheet.new(time_sheet_params)

    if @time_sheet.save
      render json: @time_sheet, status: :created, location: @time_sheet
    else
      render json: @time_sheet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_sheets/1
  def update
    if @time_sheet.update(time_sheet_params)
      render json: @time_sheet
    else
      render json: @time_sheet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_sheets/1
  def destroy
    @time_sheet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_sheet
      @time_sheet = TimeSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_sheet_params
      params.require(:time_sheet).permit(:status, :worker_id, :time_worked, :datas)
    end
end
