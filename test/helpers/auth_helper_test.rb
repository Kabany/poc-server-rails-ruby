require "test_helper"

class AuthHelperTest < ActiveSupport::TestCase
  include AuthHelper

  test "Should create a JWT token from a simple string using the default algorithm HS256" do
    @message = "Hello World!"
    @token = create_jwt_from_string(@message)
    assert_equal("eyJub1RpbWVzdGFtcCI6ZmFsc2UsImFsZyI6IkhTMjU2In0.eyJtZXNzYWdlIjoiSGVsbG8gV29ybGQhIn0.8mL5iY68I87VLbNe1r9nVkpck4qwbsm1Jh5Oxmg6RTk", @token)
  end

  test "Should create a JWT token, then decode it and must match with the original message" do
    @message = "Hello World!"
    @token = create_jwt_from_string(@message)
    @decoded = validate_jwt_token(@token)
    assert_equal(@message, @decoded)

    # VALIDATE JWT FROM NODEJS
    assert_equal(@decoded, validate_jwt_token("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXNzYWdlIjoiSGVsbG8gV29ybGQhIn0.IuiP9G4uZRbreQi4qWaZFlZMnvEtHig0AmYx-8NT7Q4"))
  end
end