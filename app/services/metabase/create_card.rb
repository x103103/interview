# frozen_string_literal: true

module Metabase
  class CreateCard < BaseRequest
    attr_accessor :title, :sql, :database_id

    def initialize(title, sql, database_id)
      @title = title
      @sql = sql
      @database_id = database_id
    end

    def call
      response = HTTParty.post(
        "https://metabase.com/cards",
        body: {
          title:,
          sql:,
          database_id:,
        },
        headers: {
          "Authorization" => "Bearer #{auth_token}"
        },
      )
      if sql.include?("GROUP BY user_id")
        HTTParty.put(
          "https://metabase.com/cards/#{response.parsed_response["id"]}",
          body: {
            visualization: "bar"
          },
          headers: {
            "Authorization" => "Bearer #{auth_token}"
          },
        )
      end
      response.parsed_response
    end
  end
end
