# app/services/jwt_service.rb
class JwtService
  SECRET_KEY = Rails.application.secret_key_base.to_s

  # Method to encode the payload and generate the JWT
  def self.encode(payload)
    payload[:exp] = 1.hour.from_now.to_i # Optional: Set an expiration time for the token
    JWT.encode(payload, SECRET_KEY) # Encode the payload with the secret key
  end

  # Method to decode the JWT and retrieve the payload
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
    decoded.first # Return the first element of the decoded array (the payload)
  rescue JWT::DecodeError => e
    nil # Return nil if there's an error decoding the token (e.g., invalid or expired token)
  end
end
