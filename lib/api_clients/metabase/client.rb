module Metabase
  class Client
    attr_reader :client_id, :client_secret

    def initialize(client_id:, client_secret:)
      @client_id = client_id
      @client_secret = client_secret
    end

    def auth_token
      Rails.cache.fetch("metabase_auth_token", expires_in: 220.minutes) do
        fetch_oauth_token
      end
    end

    def fetch_oauth_token
      res = HTTParty.post(
        "https://metabase.com/oauth",
        body: {
          grant_type: "client_credentials",
          client_id:,
          client_secret:,
        },
      )
      "Bearer #{res['access_token']}"
    end

    def create_card(params)
      response = HTTParty.post(
        "https://metabase.com/cards",
        body: params,
        headers: {
          "Authorization" => "Bearer #{auth_token}"
        }
      )
      data = response.parsed_response
      "Resources::#{data["type"].camelize}Card".constantize.new(data)
    end
  end
end
