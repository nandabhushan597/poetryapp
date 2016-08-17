require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get events_index_url
    assert_response :success
  end

  test "should get show" do
    get events_show_url
    assert_response :success
  end

  test "should get search" do
    get events_search_url
    assert_response :success
  end

  test "should get details" do
    get events_details_url
    assert_response :success
  end

end
