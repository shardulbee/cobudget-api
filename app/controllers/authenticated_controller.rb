# typed: strict

class AuthenticatedController < ApplicationController 
  include(ActionController::HttpAuthentication::Token::ControllerMethods)
  extend(T::Sig)

  before_action :deny_unauthenticated

  sig { returns(User) }
  def current_user
    T.must(authenticated_user)
  end

  private

  sig { void }
  def deny_unauthenticated
    if authenticated_user.nil?
      render status: :forbidden, json: { result: 'must provide a valid authentication token' }
    end
  rescue JsonWebToken::ExpiredToken
    render status: :forbidden, json: { result: 'token is expired. please reauthenticate.' }
  end

  sig { returns(T.nilable(User)) }
  def authenticated_user
    authenticate_with_http_token do |token, _options|
      user_id = JsonWebToken.decode(token)[:user_id]
      @user = T.let(User.find_by(id: user_id), T.nilable(User))
    end
  rescue JsonWebToken::BadToken
    nil
  end
end