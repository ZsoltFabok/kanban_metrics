module KanbanMetrics
  class ChartDataHelper
    def self.sort(chart_data)
      ordered_chart_data = {}
      chart_data.keys.sort.each do |key|
        ordered_chart_data[key] = chart_data[key]
      end
      ordered_chart_data
    end
  end
end