require 'test_helper'

class WaterLogsControllerTest < ActionController::TestCase
  setup do
    @water_log = water_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:water_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water_log" do
    assert_difference('WaterLog.count') do
      post :create, water_log: { consumed_at: @water_log.consumed_at, user_id: @water_log.user_id, volume: @water_log.volume }
    end

    assert_redirected_to water_log_path(assigns(:water_log))
  end

  test "should show water_log" do
    get :show, id: @water_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @water_log
    assert_response :success
  end

  test "should update water_log" do
    patch :update, id: @water_log, water_log: { consumed_at: @water_log.consumed_at, user_id: @water_log.user_id, volume: @water_log.volume }
    assert_redirected_to water_log_path(assigns(:water_log))
  end

  test "should destroy water_log" do
    assert_difference('WaterLog.count', -1) do
      delete :destroy, id: @water_log
    end

    assert_redirected_to water_logs_path
  end
end
