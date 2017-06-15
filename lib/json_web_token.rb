require 'active_support/core_ext/numeric/time'
require 'jwt'
require 'yaml'


class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, get_secret)
    end

    def decode(token)
      body = JWT.decode(token, get_secret)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end

    private
    def get_secret
      begin
        Rails.application.secrets.secret_key_base
      rescue
        YAML.load(File.open("../../config/secrets.yml"))['development']['secret_key_base']
      end
    end
  end
end
