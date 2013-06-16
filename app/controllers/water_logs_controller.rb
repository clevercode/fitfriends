class WaterLogsController < ApplicationController
  before_action :set_water_log, only: [:update, :destroy]
  before_action :convert_values, only: [:show, :edit]

  # GET /water_logs
  # GET /water_logs.json
  def index
    @water_logs = WaterLog.all
  end

  # GET /water_logs/1
  # GET /water_logs/1.json
  def show
  end

  # GET /water_logs/new
  def new
    @water_log = WaterLog.new
  end

  # GET /water_logs/1/edit
  def edit
  end

  # POST /water_logs
  # POST /water_logs.json
  def create
    @water_log = WaterLog.new(water_log_params)

    respond_to do |format|
      if @water_log.save
        format.html { redirect_to @water_log, notice: 'Water log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @water_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @water_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_logs/1
  # PATCH/PUT /water_logs/1.json
  def update
    respond_to do |format|
      if @water_log.update(water_log_params)
        format.html { redirect_to @water_log, notice: 'Water log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @water_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_logs/1
  # DELETE /water_logs/1.json
  def destroy
    @water_log.destroy
    respond_to do |format|
      format.html { redirect_to water_logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_log
      @water_log = WaterLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_log_params
      params.require(:water_log).permit(:volume, :consumed_at, :user_id)
    end

    def convert_values
      set_water_log
      @water_log.volume = @water_log.volume * 0.033814
    end
end
