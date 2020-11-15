require 'test_helper'

class StoreReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get store_reviews_create_url
    assert_response :success
  end

end
