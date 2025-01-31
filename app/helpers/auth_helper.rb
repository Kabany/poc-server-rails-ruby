module AuthHelper

  FIRST_JWT_SECRET = "ThisIsASuperSecret"

  def create_jwt_from_string(text)
    return JWT.encode({message: text}, FIRST_JWT_SECRET, "HS256", { noTimestamp: false })
  end

  def validate_jwt_token(token)
    return JWT.decode(token, FIRST_JWT_SECRET, true, {algorithm: "HS256"})[0]["message"]
  end
end