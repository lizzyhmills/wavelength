require "test_helper"

class FavouritePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favourite_posts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favourite_posts_destroy_url
    assert_response :success
  end
end
