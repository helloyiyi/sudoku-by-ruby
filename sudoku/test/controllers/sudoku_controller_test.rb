require 'test_helper'

class SudokuControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get sudoku_home_url
    assert_response :success
  end

end
