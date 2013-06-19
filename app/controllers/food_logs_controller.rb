class FoodLogsController < ApplicationController
  before_action :authorize, :set_user
  before_action :set_food_log, only: [:show, :edit, :update, :destroy]

  # GET /food_logs
  # GET /food_logs.json
  def index
    @food_logs = @user.food_logs.all
  end

  # GET /food_logs/1
  # GET /food_logs/1.json
  def show
  end

  # GET /food_logs/new
  def new
    @food_log = @user.food_logs.new
  end

  # GET /food_logs/1/edit
  def edit
  end

  # POST /food_logs
  # POST /food_logs.json
  def create
    @food_log = @user.food_logs.new(food_log_params)

    respond_to do |format|
      if @food_log.save
        format.html { redirect_to @user, notice: 'Food log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @food_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_logs/1
  # PATCH/PUT /food_logs/1.json
  def update
    respond_to do |format|
      if @food_log.update(food_log_params)
        format.html { redirect_to @user, notice: 'Food log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_logs/1
  # DELETE /food_logs/1.json
  def destroy
    @food_log.destroy
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
    def set_food_log
      @food_log = @user.food_logs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_log_params
      params.require(:food_log).permit(:food_name, :carbs, :fat, :protein, :consumed_at, :user_id)
    end
end
