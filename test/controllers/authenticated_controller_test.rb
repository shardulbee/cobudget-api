# typed: false

require "test_helper"

class MockController < AuthenticatedController
  def find
    head :ok
  end
end

class AuthenticatedControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.routes.draw do
      get '/mock', to: 'mock#find'
    end
  end

  def teardown
    Rails.application.reload_routes!
  end

  def test_no_token_provided
    get '/mock'
    assert_response :forbidden
    assert_equal ({ 'result' => 'must provide a valid authentication token' }), response.parsed_body
  end

  def test_bad_token_provided
    get '/mock', headers: { 'Authorization': 'Bearer bad_token' }
    assert_response :forbidden
    assert_equal ({ 'result' => 'must provide a valid authentication token' }), response.parsed_body
  end

  def test_expired_token_provided
    token_expires_at = 10.minutes.from_now
    user = create(:user)
    token = JsonWebToken.encode(payload: { user_id: user.id }, expires_at: token_expires_at)

    travel_to(token_expires_at + 1.minute) do
      get '/mock', headers: { 'Authorization': "Bearer #{token}" }
      assert_response :forbidden
      assert_equal ({ 'result' => 'token is expired. please reauthenticate.' }), response.parsed_body
    end
  end

  def test_successful_auth
    get '/mock', headers: auth_headers_for(create(:user))
    assert_response :ok
  end
end
