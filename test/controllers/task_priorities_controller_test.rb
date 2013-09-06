require 'test_helper'

class TaskPrioritiesControllerTest < ActionController::TestCase
  setup do
    @task_priority = task_priorities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_priorities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_priority" do
    assert_difference('TaskPriority.count') do
      post :create, task_priority: { name: @task_priority.name }
    end

    assert_redirected_to task_priority_path(assigns(:task_priority))
  end

  test "should show task_priority" do
    get :show, id: @task_priority
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_priority
    assert_response :success
  end

  test "should update task_priority" do
    patch :update, id: @task_priority, task_priority: { name: @task_priority.name }
    assert_redirected_to task_priority_path(assigns(:task_priority))
  end

  test "should destroy task_priority" do
    assert_difference('TaskPriority.count', -1) do
      delete :destroy, id: @task_priority
    end

    assert_redirected_to task_priorities_path
  end
end
