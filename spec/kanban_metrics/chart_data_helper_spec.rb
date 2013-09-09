require 'spec_helper'

module KanbanMetrics
  describe ChartDataHelper do
    it "should return the same content but ordered by key" do
      chart_data = {"1" => "1", "3" => "3", "2" => "2"}
      sorted_chart_data = ChartDataHelper.sort(chart_data)
      assert_hash_order_matters(sorted_chart_data, {"1" => "1", "2" => "2", "3" => "3"})
    end
  end
end