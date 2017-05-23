require 'test_helper'

class SourceProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_provider = source_providers(:one)
  end

  test "should get index" do
    get source_providers_url, as: :json
    assert_response :success
  end

  test "should create source_provider" do
    assert_difference('SourceProvider.count') do
      post source_providers_url, params: { source_provider: { [name: @source_provider.[name, address: @source_provider.address, url: @source_provider.url } }, as: :json
    end

    assert_response 201
  end

  test "should show source_provider" do
    get source_provider_url(@source_provider), as: :json
    assert_response :success
  end

  test "should update source_provider" do
    patch source_provider_url(@source_provider), params: { source_provider: { [name: @source_provider.[name, address: @source_provider.address, url: @source_provider.url } }, as: :json
    assert_response 200
  end

  test "should destroy source_provider" do
    assert_difference('SourceProvider.count', -1) do
      delete source_provider_url(@source_provider), as: :json
    end

    assert_response 204
  end
end
