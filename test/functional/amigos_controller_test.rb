require 'test_helper'

class AmigosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amigos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amigo" do
    assert_difference('Amigo.count') do
      post :create, :amigo => { }
    end

    assert_redirected_to amigo_path(assigns(:amigo))
  end

  test "should show amigo" do
    get :show, :id => amigos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => amigos(:one).to_param
    assert_response :success
  end

  test "should update amigo" do
    put :update, :id => amigos(:one).to_param, :amigo => { }
    assert_redirected_to amigo_path(assigns(:amigo))
  end

  test "should destroy amigo" do
    assert_difference('Amigo.count', -1) do
      delete :destroy, :id => amigos(:one).to_param
    end

    assert_redirected_to amigos_path
  end
end
