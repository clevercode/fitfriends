class WeightLogsController < ApplicationController
  before_action :set_user
  before_action :set_weight_log, only: [:update, :destroy]
  before_action :convert_values, only: [:show, :edit]

  def index
    @weight_logs = WeightLog.all
  end

  def show
  end

  def new
    @weight_log = WeightLog.new
  end

  def edit
  end

  def create
    @weight_log = WeightLog.new(weight_log_params)

    respond_to do |format|
      if @weight_log.save
        format.html { redirect_to @user, notice: 'Weight log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @weight_log.update(weight_log_params)
        format.html { redirect_to @user, notice: 'Weight log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weight_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weight_log.destroy
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
    def set_weight_log
      @weight_log = @user.weight_logs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_log_params
      params.require(:weight_log).permit(:weight, :measured_at, :user_id)
    end

    def convert_values
      set_weight_log
      @weight_log.weight = @weight_log.weight * 2.20462
    end
end
