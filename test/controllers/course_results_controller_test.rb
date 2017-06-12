require 'test_helper'

class CourseResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_result = course_results(:one)
  end

  test "should get index" do
    get v1_courses_url, as: :json
    assert_response :success
  end

  test "should show course_result" do
    get v1_courses_history_url(@course_result), as: :json
    assert_response :success
  end




end
