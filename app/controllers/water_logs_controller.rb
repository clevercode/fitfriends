class WaterLogsController < ApplicationController
  before_action :set_user
  before_action :set_water_log, only: [:update, :destroy]
  before_action :convert_values, only: [:show, :edit]

  def index
    @water_logs = @user.water_logs.all
  end

  def show
  end

  def new
    @water_log = @user.water_logs.new
  end

  def edit
  end

  def create
    @water_log = WaterLog.new(water_log_params)

    respond_to do |format|
      if @water_log.save
        format.html { redirect_to @user, notice: 'Water log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @water_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @water_log.update(water_log_params)
        format.html { redirect_to @user, notice: 'Water log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @water_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @water_log.destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_water_log
      @water_log = @user.water_logs.find(params[:id])
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
