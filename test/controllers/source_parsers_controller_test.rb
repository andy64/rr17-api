require 'test_helper'

class SourceParsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_parser = source_parsers(:one)
  end

  test "should get index" do
    get source_parsers_url, as: :json
    assert_response :success
  end

  test "should create source_parser" do
    assert_difference('SourceParser.count') do
      post source_parsers_url, params: { source_parser: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show source_parser" do
    get source_parser_url(@source_parser), as: :json
    assert_response :success
  end

  test "should update source_parser" do
    patch source_parser_url(@source_parser), params: { source_parser: {  } }, as: :json
    assert_response 200
  end

  test "should destroy source_parser" do
    assert_difference('SourceParser.count', -1) do
      delete source_parser_url(@source_parser), as: :json
    end

    assert_response 204
  end
end
