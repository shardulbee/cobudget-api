# typed: strict

class InstitutionAuthorizationController < AuthenticatedController
  extend(T::Sig)

  sig { void }
  def begin
    render :ok, json: { link_token: PlaidAdaptor::Client.new.create_link_token(id: T.must(current_user.id)) }
  end

  class CompleteParams < T::Struct
    const :public_token, String
  end
  sig { void }
  def complete
    typed_params = TypedParams[CompleteParams].new.extract!(params)
    institution_details = PlaidAdaptor::Client.new.exchange(public_token: typed_params.public_token)
    institution = Institution.create(
      user: current_user,
      item_id: institution_details.item_id,
      access_token: institution_details.access_token,
    )

    render :ok, json: { result: 'successfully authenticated'}
  end
end
