require 'test_helper'

class RadiosControllerTest < ActionController::TestCase
  setup do
    @radio = radios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:radios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create radio" do
    assert_difference('Radio.count') do
      post :create, radio: { content: @radio.content, description: @radio.description, name: @radio.name }
    end

    assert_redirected_to radio_path(assigns(:radio))
  end

  test "should show radio" do
    get :show, id: @radio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @radio
    assert_response :success
  end

  test "should update radio" do
    put :update, id: @radio, radio: { content: @radio.content, description: @radio.description, name: @radio.name }
    assert_redirected_to radio_path(assigns(:radio))
  end

  test "should destroy radio" do
    assert_difference('Radio.count', -1) do
      delete :destroy, id: @radio
    end

    assert_redirected_to radios_path
  end
end
