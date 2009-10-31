require 'test_helper'

class Admin::GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    assert_difference('Admin::Group.count') do
      post :create, :group => { }
    end

    assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, :id => admin_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_groups(:one).to_param
    assert_response :success
  end

  test "should update group" do
    put :update, :id => admin_groups(:one).to_param, :group => { }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Admin::Group.count', -1) do
      delete :destroy, :id => admin_groups(:one).to_param
    end

    assert_redirected_to admin_groups_path
  end
end
