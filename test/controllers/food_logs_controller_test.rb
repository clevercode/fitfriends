require 'test_helper'

class FoodLogsControllerTest < ActionController::TestCase
  setup do
    @food_log = food_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_log" do
    assert_difference('FoodLog.count') do
      post :create, food_log: { carbs: @food_log.carbs, consumed_at: @food_log.consumed_at, fat: @food_log.fat, food_name: @food_log.food_name, protein: @food_log.protein, user_id: @food_log.user_id }
    end

    assert_redirected_to food_log_path(assigns(:food_log))
  end

  test "should show food_log" do
    get :show, id: @food_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_log
    assert_response :success
  end

  test "should update food_log" do
    patch :update, id: @food_log, food_log: { carbs: @food_log.carbs, consumed_at: @food_log.consumed_at, fat: @food_log.fat, food_name: @food_log.food_name, protein: @food_log.protein, user_id: @food_log.user_id }
    assert_redirected_to food_log_path(assigns(:food_log))
  end

  test "should destroy food_log" do
    assert_difference('FoodLog.count', -1) do
      delete :destroy, id: @food_log
    end

    assert_redirected_to food_logs_path
  end
end
