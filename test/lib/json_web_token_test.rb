# typed: ignore

require "test_helper"

class JsonWebTokenTest < ActiveSupport::TestCase
  def test_encode_expired
    expiry_time = 10.minutes.from_now
    token = JsonWebToken.encode(payload: {}, expires_at: expiry_time)

    travel_to(expiry_time) do
      assert_raises(JWT::ExpiredSignature) do
        JWT.decode(token, Rails.application.secrets.secret_key_base)
      end
    end
  end

  def test_encode_not_expired
    expiry_time = 1.minute.from_now
    token = JsonWebToken.encode(payload: {}, expires_at: expiry_time)

    assert_nothing_raised do
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    end
  end

  def test_encode_payload
    expiry_time = 1.minute.from_now
    expected = { a: 1, b: 2 }
    token = JsonWebToken.encode(payload: expected, expires_at: expiry_time)
    actual = JWT.decode(token, Rails.application.secrets.secret_key_base)[0].transform_keys(&:to_sym).except(:exp)
    assert_equal expected, actual
  end

  def test_decode_expired
    expiry_time = 10.minutes.from_now
    token = JsonWebToken.encode(payload: {}, expires_at: expiry_time)
    travel_to(expiry_time) do
      assert_raises(JsonWebToken::ExpiredToken) do
        JsonWebToken.decode(token)
      end
    end
  end

  def test_decode_not_expired
    expiry_time = 10.minutes.from_now
    token = JsonWebToken.encode(payload: {}, expires_at: expiry_time)
    assert_nothing_raised do
      JsonWebToken.decode(token)
    end
  end

  def test_decode_payload
    expected = { a: 1, b: 'this is a string' }
    token = JsonWebToken.encode(payload: expected, expires_at: 10.minutes.from_now)
    actual = JsonWebToken.decode(token)
    assert_equal expected, actual
  end
end
