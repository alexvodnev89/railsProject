require 'test_helper'

class GymclassesControllerTest < ActionController::TestCase
  setup do
    @gymclass = gymclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gymclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gymclass" do
    assert_difference('Gymclass.count') do
      post :create, gymclass: { description: @gymclass.description, name: @gymclass.name, weekday: @gymclass.weekday }
    end

    assert_redirected_to gymclass_path(assigns(:gymclass))
  end

  test "should show gymclass" do
    get :show, id: @gymclass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gymclass
    assert_response :success
  end

  test "should update gymclass" do
    patch :update, id: @gymclass, gymclass: { description: @gymclass.description, name: @gymclass.name, weekday: @gymclass.weekday }
    assert_redirected_to gymclass_path(assigns(:gymclass))
  end

  test "should destroy gymclass" do
    assert_difference('Gymclass.count', -1) do
      delete :destroy, id: @gymclass
    end

    assert_redirected_to gymclasses_path
  end
end
