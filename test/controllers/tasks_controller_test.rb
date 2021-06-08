require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    @task = tasks(:one)
  end
  
  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get new' do
    get new_task_path
    assert_response :success
  end

  test 'should get create' do
    post tasks_path, params: { task: {title: 'task title', body: 'task body', deadline: Date.tomorrow, category_id: ''} }
    assert_response :redirect
  end


  test "should create task" do
    assert_difference 'Task.count', 1 do
      post tasks_path(@task), params: { task: {title: 'task title', body: 'task body', deadline: Date.tomorrow, category_id: ''} }
    end
    assert_redirected_to root_path
  end

  test "should show a task" do
    get task_path(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_path(@task)
    assert_response :success
  end

  test "should update a task" do
    put task_url(@task), params: { task: {title: 'task title', body: 'task body', deadline: Date.tomorrow, category_id: ''} }
    assert_redirected_to root_path
  end

  test "should destroy a task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to root_path
  end


end
