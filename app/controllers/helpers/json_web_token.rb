require 'jwt'

class JsonWebToken
  # Secret key to encode and decode the token
  SECRET_KEY = '486f95602bdb97a9d00835ecd4fe5bb4abe179e2cbd47fdbcfcfd324f8b7ddef4b6dec3334184fb22f8dcf1e4b977469ff4bfbb21647361a7df0d800f37629ab'

  # Encode a payload into a JWT token
  # json_web_token.rb
    def self.encode(payload, expiration = 24.hours.from_now)
      payload[:exp] = expiration.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY).first
      HashWithIndifferentAccess.new(decoded)
    end
  end

