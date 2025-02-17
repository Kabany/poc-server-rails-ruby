require "test_helper"

class AuthHelperTest < ActiveSupport::TestCase
  include AuthHelper

  test "Should create a JWT token from a simple string using the default algorithm HS256" do
    @message = "Hello World!"
    @token = create_jwt_from_string(@message)
    assert_equal("eyJhbGciOiJIUzI1NiJ9.eyJtZXNzYWdlIjoiSGVsbG8gV29ybGQhIn0.kiLVWiCroYBS-sgSmTP_u74OmiLt_l3UeUBGfM-lmE8", @token)
  end

  test "Should create a JWT token, then decode it and must match with the original message" do
    @message = "Hello World!"
    @token = create_jwt_from_string(@message)
    @decoded = validate_jwt_token(@token)
    assert_equal(@message, @decoded)

    # VALIDATE JWT FROM NODEJS
    assert_equal(@decoded, validate_jwt_token("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXNzYWdlIjoiSGVsbG8gV29ybGQhIn0.IuiP9G4uZRbreQi4qWaZFlZMnvEtHig0AmYx-8NT7Q4"))
    # VALIDATE JWT FROM Swift
    assert_equal(@decoded, validate_jwt_token("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJtZXNzYWdlIjoiSGVsbG8gV29ybGQhIn0.mahh4kwbMrH_-7Np_G88KLJmkW5GtFYzbLiWAfpRiJQ"))
  end

  test "Should create a Hash token from a simple string using the SHA512 Hex algorithm" do
    @message = "Hello World!"
    @token = create_hash(@message)
    assert_equal("861844d6704e8573fec34d967e20bcfef3d424cf48be04e6dc08f2bd58c729743371015ead891cc3cf1c9d34b49264b510751b1ff9e537937bc46b5d6ff4ecc8", @token)
  end

  test "Should create a TOTP token from a simple string using the SHA512 algorithm" do
    @message = "JBSWY3DPEHPK3PXP"
    @token = create_totp(@message)
    @token2 = create_totp(@message)
    assert_equal(@token, @token2)
  end
end