require 'test_helper'

class PropersControllerTest < ActionController::TestCase
  setup do
    @proper = propers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:propers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proper" do
    assert_difference('Proper.count') do
      post :create, proper: @proper.attributes
    end

    assert_redirected_to proper_path(assigns(:proper))
  end

  test "should show proper" do
    get :show, id: @proper.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proper.to_param
    assert_response :success
  end

  test "should update proper" do
    put :update, id: @proper.to_param, proper: @proper.attributes
    assert_redirected_to proper_path(assigns(:proper))
  end

  test "should destroy proper" do
    assert_difference('Proper.count', -1) do
      delete :destroy, id: @proper.to_param
    end

    assert_redirected_to propers_path
  end
end
