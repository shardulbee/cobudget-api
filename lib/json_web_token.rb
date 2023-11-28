# typed: strict

module JsonWebToken
  class ExpiredToken < StandardError; end
  class BadToken < StandardError; end
  class << self
    extend(T::Sig)

    sig { params(payload: T::Hash[Symbol, T.untyped], expires_at: Time).returns(String) }
    def encode(payload:, expires_at: 24.hours.from_now.time)
      JWT.encode(payload.dup.merge({ exp: expires_at.to_i }), Rails.application.secrets.secret_key_base)
    end

    sig { params(token: String).returns(T::Hash[Symbol, T.untyped]) }
    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)[0].transform_keys(&:to_sym).except(:exp)
    rescue JWT::ExpiredSignature
      raise ExpiredToken
    rescue JWT::DecodeError
      raise BadToken
    end
  end
end