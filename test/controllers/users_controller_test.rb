# typed: false
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def test_create
    assert_changes -> { User.count }, from: 0, to: 1 do
      post '/users', as: :json,
        headers: { 'Authorization': "Bearer #{ENV['CLIENT_BEARER_TOKEN']}"},
        params: { email: 'test@baral.ca', password: 'thingyy', first_name: 'Shardul', last_name: 'Baral' }
      assert_response :ok
      assert_equal({ "result" => 'successfully created user' }, response.parsed_body)
    end
  end

  def test_create_invalid
    assert_no_changes -> { User.count } do
      post '/users', as: :json,
        headers: { 'Authorization': "Bearer #{ENV['CLIENT_BEARER_TOKEN']}"},
        params: { email: 'invalid email', password: 'thingyy', first_name: 'Shardul', last_name: 'Baral' }

      assert_response :bad_request
      assert_equal({ "result" => 'Email is invalid' }, response.parsed_body)
    end
  end

  def test_authenticate
    user = create(:user)
    post '/login', as: :json,
      headers: { 'Authorization': "Bearer #{ENV['CLIENT_BEARER_TOKEN']}"},
      params: { email: user.email, password: user.password }

    assert_response :ok
    assert_equal true, response.parsed_body.include?("token")
    assert_equal "user with email `#{user.email}` successfully logged in", response.parsed_body["result"]
  end

  def test_authenticate_wrong_password
    user = create(:user)
    post '/login', as: :json,
      headers: { 'Authorization': "Bearer #{ENV['CLIENT_BEARER_TOKEN']}"},
      params: { email: user.email, password: 'wrong password' }

    assert_response :forbidden
    assert_equal({ "result" => "email and password combination is incorrect" }, response.parsed_body)
  end

  def test_authenticate_user_not_found
    email = 'no_user@fake.com'
    post '/login', as: :json,
      headers: { 'Authorization': "Bearer #{ENV['CLIENT_BEARER_TOKEN']}"},
      params: { email: 'no_user@fake.com', password: 'who cares' }

    assert_response :forbidden
    assert_equal({ "result" => "email and password combination is incorrect" }, response.parsed_body)
  end
end
