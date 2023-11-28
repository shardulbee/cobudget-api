# typed: strict

class UsersController < ApplicationController
  extend(T::Sig)

  class CreateParams < T::Struct
    const :email, String
    const :password, String
    const :first_name, String
    const :last_name, String
  end
  sig { void }
  def create
    typed_params = TypedParams[CreateParams].new.extract!(params)
    user = User.new(typed_params.serialize)

    if user.save
      render status: :ok, json: { result: 'successfully created user' }
    elsif user.invalid?
      render status: :bad_request, json: { result: user.errors.full_messages.join('; ') }
    else
      render status: :internal_server_error, json: { result: 'unable to create user' }
    end
  end

  class AuthenticateParams < T::Struct
    const :email, String
    const :password, String
  end
  sig { void }
  def authenticate
    typed_params = TypedParams[AuthenticateParams].new.extract!(params)
    user = User.find_by(email: typed_params.email)

    if user.present? && T.unsafe(user).authenticate(typed_params.password)
      render status: :ok, json: {
        result: "user with email `#{typed_params.email}` successfully logged in",
        token: JsonWebToken.encode(payload: { user_id: user.id })
      }
    else
      render status: :forbidden, json: { result: "email and password combination is incorrect"}
    end
  end
end
