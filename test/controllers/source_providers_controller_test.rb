require 'test_helper'


class SourceProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_provider = source_providers(:one)
    @user = users(:one)
    post v1_auth_user_path, params: { email: @user.email, password: 'admin' }, as: :json
    @token ||= JSON.parse(response.body)['auth_token']
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

  test "should parse paritet bank" do
    post v1_parser_path(@source_provider.name),
         headers:{'Content-Type': 'application/json',
                  'Authorization': @token},
         as: :json
    assert_response :success
    JSON.parse(response.body)['result'].values.each{|val| assert(/\d\.\d{4}/.match?(val)) }
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
