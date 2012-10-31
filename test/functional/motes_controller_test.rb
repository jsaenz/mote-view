require 'test_helper'

class MotesControllerTest < ActionController::TestCase
  setup do
    @mote = motes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mote" do
    assert_difference('Mote.count') do
      post :create, mote: { name: @mote.name, radio: @mote.radio }
    end

    assert_redirected_to mote_path(assigns(:mote))
  end

  test "should show mote" do
    get :show, id: @mote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mote
    assert_response :success
  end

  test "should update mote" do
    put :update, id: @mote, mote: { name: @mote.name, radio: @mote.radio }
    assert_redirected_to mote_path(assigns(:mote))
  end

  test "should destroy mote" do
    assert_difference('Mote.count', -1) do
      delete :destroy, id: @mote
    end

    assert_redirected_to motes_path
  end
end
