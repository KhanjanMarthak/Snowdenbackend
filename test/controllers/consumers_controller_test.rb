require "test_helper"

class ConsumersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consumers_index_url
    assert_response :success
  end

  test "should get show" do
    get consumers_show_url
    assert_response :success
  end

  test "should get create" do
    get consumers_create_url
    assert_response :success
  end
end
