require 'test_helper'

class HomepagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homepages_index_url
    assert_response :success
  end

end
