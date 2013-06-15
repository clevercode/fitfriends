require 'test_helper'

class WeightLogsControllerTest < ActionController::TestCase
  setup do
    @weight_log = weight_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weight_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weight_log" do
    assert_difference('WeightLog.count') do
      post :create, weight_log: { measured_at: @weight_log.measured_at, user_id: @weight_log.user_id, weight: @weight_log.weight }
    end

    assert_redirected_to weight_log_path(assigns(:weight_log))
  end

  test "should show weight_log" do
    get :show, id: @weight_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weight_log
    assert_response :success
  end

  test "should update weight_log" do
    patch :update, id: @weight_log, weight_log: { measured_at: @weight_log.measured_at, user_id: @weight_log.user_id, weight: @weight_log.weight }
    assert_redirected_to weight_log_path(assigns(:weight_log))
  end

  test "should destroy weight_log" do
    assert_difference('WeightLog.count', -1) do
      delete :destroy, id: @weight_log
    end

    assert_redirected_to weight_logs_path
  end
end
