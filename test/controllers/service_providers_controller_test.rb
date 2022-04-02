require "test_helper"

class ServiceProvidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_providers_index_url
    assert_response :success
  end

  test "should get show" do
    get service_providers_show_url
    assert_response :success
  end

  test "should get create" do
    get service_providers_create_url
    assert_response :success
  end
end
