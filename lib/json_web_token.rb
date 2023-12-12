class JsonWebToken
  
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, SECRET_KEY)[0])
  rescue
    nil
  end
end