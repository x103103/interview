# frozen_string_literal: true

module Metabase
  module Resources
    class Card
      def initialize(data)
        @data = data
      end

      def title
        if @data["title"].present?
          @data["title"]
        else
          @data["name"]
        end
      end
    end
  end
end
