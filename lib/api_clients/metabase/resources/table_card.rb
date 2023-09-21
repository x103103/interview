# frozen_string_literal: true

module Metabase
  module Resources
    class TableCard < Card
      def rows
        @data["rows"]
      end
    end
  end
end
