require 'test_helper'

class MembershipOptionsControllerTest < ActionController::TestCase
  setup do
    @membership_option = membership_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membership_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership_option" do
    assert_difference('MembershipOption.count') do
      post :create, membership_option: { description: @membership_option.description, price: @membership_option.price, title: @membership_option.title }
    end

    assert_redirected_to membership_option_path(assigns(:membership_option))
  end

  test "should show membership_option" do
    get :show, id: @membership_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership_option
    assert_response :success
  end

  test "should update membership_option" do
    patch :update, id: @membership_option, membership_option: { description: @membership_option.description, price: @membership_option.price, title: @membership_option.title }
    assert_redirected_to membership_option_path(assigns(:membership_option))
  end

  test "should destroy membership_option" do
    assert_difference('MembershipOption.count', -1) do
      delete :destroy, id: @membership_option
    end

    assert_redirected_to membership_options_path
  end
end
