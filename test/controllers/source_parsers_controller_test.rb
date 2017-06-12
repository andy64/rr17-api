require 'test_helper'

class SourceParsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_parser = source_parsers(:one)
  end

  test "should get index" do
    get v1_source_parsers_url, as: :json
    assert_response :success
  end

  test "should not create source_parser without authentification" do
    assert_difference('SourceParser.count', 0) do
      post v1_source_parsers_url, params: { source_parser: { parser_name: @source_parser.parser_name+'one', url: @source_parser.url  } }, as: :json
    end
    assert_response 401
  end

  test "should show source_parser" do
    get v1_source_parser_url(@source_parser), as: :json
    assert_response :success
  end

  test "should not update source_parser without authentification" do
    patch v1_source_parser_url(@source_parser), params: { source_parser: { parser_name: @source_parser.parser_name, url: @source_parser.url  } }, as: :json
    assert_response 401
  end

  test "should destroy source_parser" do
    assert_difference('SourceParser.count', 0) do
      delete v1_source_parser_url(@source_parser), as: :json
    end
    assert_response 401
  end

end
