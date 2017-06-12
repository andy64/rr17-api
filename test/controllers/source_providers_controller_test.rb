require 'test_helper'


class SourceProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_provider = source_providers(:one)
    @user = users(:one)
  end

 test "should parse by post request for authenticated user" do
    #post v1_auth_user_url, params: { email: @user.email, password: @user.password }, as: :json
    post "/v1/source_provider/nb/start_now", params: {  }, as: :json
    assert_response :success
  end

  test "should get index" do
    get v1_source_providers_url, as: :json
    assert_response :success
  end

  test "should not create source_provider without authentification" do
    assert_difference('SourceProvider.count', 0) do
      post v1_source_providers_url, params: { source_provider: { name: @source_provider.name, address: @source_provider.address, url: @source_provider.url } }, as: :json
    end

    assert_response 401
  end

  test "should show source_provider" do
    get v1_source_provider_url(@source_provider), as: :json
    assert_response :success
  end

  test "should not update source_provider without authentification" do
    patch v1_source_provider_url(@source_provider), params: { source_provider: { name: @source_provider.name, address: @source_provider.address, url: @source_provider.url } }, as: :json
    assert_response 401
  end

  test "should not destroy source_provider without authentification" do
    assert_difference('SourceProvider.count', 0) do
      delete v1_source_provider_url(@source_provider), as: :json
    end

    assert_response 401
  end
end
