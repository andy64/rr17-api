require 'test_helper'

class CourseResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_result = course_results(:one)
  end

  test "should get index" do
    get course_results_url, as: :json
    assert_response :success
  end

  test "should create course_result" do
    assert_difference('CourseResult.count') do
      post course_results_url, params: { course_result: { eur: @course_result.eur, rur: @course_result.rur, usd: @course_result.usd } }, as: :json
    end

    assert_response 201
  end

  test "should show course_result" do
    get course_result_url(@course_result), as: :json
    assert_response :success
  end

  test "should update course_result" do
    patch course_result_url(@course_result), params: { course_result: { eur: @course_result.eur, rur: @course_result.rur, usd: @course_result.usd } }, as: :json
    assert_response 200
  end

  test "should destroy course_result" do
    assert_difference('CourseResult.count', -1) do
      delete course_result_url(@course_result), as: :json
    end

    assert_response 204
  end
end
