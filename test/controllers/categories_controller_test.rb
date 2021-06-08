require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers
 
  setup do
    # get '/users/sign_in'
    sign_in users(:one)
    # post user_session_url

    @category = categories(:one)
  end
  
  test 'should get index' do
    get categories_path
    assert_response :success
  end

  test 'should get new' do
    get new_category_path
    assert_response :success
  end

  test "should create a category" do
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: 'category name'} }
      assert_redirected_to root_path
    end
  end

  test "should show a category" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update a category" do
    put category_url(@category), params: { category: {name: 'category name'} }
    assert_redirected_to root_path
  end

  test "should destroy a category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to root_path
  end

end
