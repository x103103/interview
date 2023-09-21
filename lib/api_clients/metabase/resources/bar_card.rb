# frozen_string_literal: true

module Metabase
  module Resources
    class BarCard < Card
      def graph_dimensions
        @data["graph.dimensions"]
      end

      def graph_metrics
        @data["graph.metrics"]
      end
    end
  end
end
