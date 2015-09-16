require 'test_helper'

class ServiceServersControllerTest < ActionController::TestCase
  setup do
    @service_server = service_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_server" do
    assert_difference('ServiceServer.count') do
      post :create, service_server: { server_id: @service_server.server_id, service_id: @service_server.service_id, user_id: @service_server.user_id }
    end

    assert_redirected_to service_server_path(assigns(:service_server))
  end

  test "should show service_server" do
    get :show, id: @service_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_server
    assert_response :success
  end

  test "should update service_server" do
    patch :update, id: @service_server, service_server: { server_id: @service_server.server_id, service_id: @service_server.service_id, user_id: @service_server.user_id }
    assert_redirected_to service_server_path(assigns(:service_server))
  end

  test "should destroy service_server" do
    assert_difference('ServiceServer.count', -1) do
      delete :destroy, id: @service_server
    end

    assert_redirected_to service_servers_path
  end
end
