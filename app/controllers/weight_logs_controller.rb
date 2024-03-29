class WeightLogsController < ApplicationController
  before_action :authorize, :set_user
  before_action :set_weight_log, only: %i(show edit update destroy)

  def index
    @weight_logs = @user.weight_logs
  end

  def show
  end

  def new
    @weight_log = @user.weight_logs.new
  end

  def edit
  end

  def create
    @weight_log = @user.weight_logs.new(weight_log_params)

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
      params.require(:weight_log).permit(:weight, :measured_at, :user_id, :weight_in_lbs)
    end
end
