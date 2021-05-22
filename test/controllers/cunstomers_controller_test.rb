require 'test_helper'

class CunstomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cunstomers_show_url
    assert_response :success
  end

  test "should get quit" do
    get cunstomers_quit_url
    assert_response :success
  end

  test "should get edit" do
    get cunstomers_edit_url
    assert_response :success
  end

end
