module AuthHelper

  FIRST_JWT_SECRET = "ThisIsASuperSecret"

  def create_jwt_from_string(text)
    return JWT.encode({message: text}, FIRST_JWT_SECRET, "HS256")
  end

  def validate_jwt_token(token)
    return JWT.decode(token, FIRST_JWT_SECRET, true, {algorithm: "HS256"})[0]["message"]
  end

  def create_hash(text)
    return Digest::SHA2.new(512).hexdigest(text)
  end

  def create_totp(text)
    return ROTP::TOTP.new(text, {digits: 8, digest: "sha512", interval: 30}).now
  end
end