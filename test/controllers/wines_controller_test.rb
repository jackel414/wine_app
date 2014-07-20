require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, wine: { grapes: @wine.grapes, name: @wine.name, province: @wine.province, stored: @wine.stored, country: @wine.country, wine_type: @wine.wine_type }
    end

    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, id: @wine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wine
    assert_response :success
  end

  test "should update wine" do
    patch :update, id: @wine, wine: { grapes: @wine.grapes, name: @wine.name, region: @wine.region, stored: @wine.stored, country: @wine.country }
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, id: @wine
    end

    assert_redirected_to wines_path
  end
end
