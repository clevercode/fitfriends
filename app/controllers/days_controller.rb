class DaysController < ApplicationController

  respond_to :json

  def index
    @day = Hash.new
    @day[:date]  = params[:date]
    @day[:users] = Array.new

    users = User.all
    users.each do |user|
      @day[:users] << get_user_info(user)
    end

    respond_with @day
  end

  def show
    @day = Hash.new
    @day[:date] = params[:date]
    @day[:user] = get_user_info(User.find(params[:user_id]))
    respond_with @day
  end

  def get_user_info(user)
    data = Hash.new
    data[:id]   = user.id
    data[:name] = user.name
    data[:start_weight]   = user.start_weight
    data[:current_weight] = user.current_weight

    data[:water]   = user.water_consumed(Date.parse(@day[:date]))
    data[:carbs]   = 0
    data[:protein] = 0
    data[:fat]     = 0
    user.food_logs.each do |food_log|
      if food_log.consumed_at.to_date == Date.parse(@day[:date])
        data[:carbs]   += food_log.carbs
        data[:protein] += food_log.protein
        data[:fat]     += food_log.fat
      end
    end

    data
  end
end
