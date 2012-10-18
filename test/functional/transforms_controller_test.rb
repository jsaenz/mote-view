require 'test_helper'

class TransformsControllerTest < ActionController::TestCase
  setup do
    @transform = transforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transform" do
    assert_difference('Transform.count') do
      post :create, transform: { content: @transform.content, description: @transform.description, name: @transform.name }
    end

    assert_redirected_to transform_path(assigns(:transform))
  end

  test "should show transform" do
    get :show, id: @transform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transform
    assert_response :success
  end

  test "should update transform" do
    put :update, id: @transform, transform: { content: @transform.content, description: @transform.description, name: @transform.name }
    assert_redirected_to transform_path(assigns(:transform))
  end

  test "should destroy transform" do
    assert_difference('Transform.count', -1) do
      delete :destroy, id: @transform
    end

    assert_redirected_to transforms_path
  end
end
