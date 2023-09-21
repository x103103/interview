module Metabase
  class BaseRequest
    def auth_token
      HTTParty.get(
        'https://metabase.com/auth',
        body: {
          login: Rails.application.secrets.metabase_login,
          password: Rails.application.secrets.metabase_password,
        }
      )
    end
  end
end
