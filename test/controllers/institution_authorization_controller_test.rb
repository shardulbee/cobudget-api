# typed: false

require "test_helper"

class InstitutionAuthorizationControllerTest < ActionDispatch::IntegrationTest
  def test_begin_authorization
    use_vcr do
      user = create(:user)
      post '/institution_authorization/begin',
        params: { email: user.email, password: user.password }, headers: auth_headers_for(user)
      assert_response :success
      assert_match /link-sandbox-[a-z0-9\-]+$/, response.parsed_body["link_token"]
    end
  end

  def test_complete_authorization
    use_vcr do
      user = create(:user)
      assert_difference -> { Institution.count }, 1 do
        post '/institution_authorization/complete',
          params: { email: user.email, password: user.password, public_token: sandbox_public_token_create },
          headers: auth_headers_for(user)
        assert_response :success
      end
    end
  end
end
