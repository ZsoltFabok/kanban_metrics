require 'spec_helper'
module KanbanMetrics
	module Commands
		describe Io do
			before(:each) do
				@work_item1 = WorkItem.new({:started => "2013-01-02", :delivered => "2013-01-05" })
				@work_item2 = WorkItem.new({:started => "2013-01-02", :delivered => "2013-01-02" })
				@work_item3 = WorkItem.new({:started => "2013-01-06", :delivered => "2013-01-08" })
			end

			it "should return in and out by week" do
				work_items = [@work_item1, @work_item2, @work_item3]
				chart_data = Io.new.execute(work_items)
				assert_hash_order_matters(chart_data, {"2013-1" => [3,2], "2013-2" => [0,1]})
			end

			it "should return in and out for a time range" do
				work_items = [@work_item1, @work_item2, @work_item3]
				chart_data = Io.new.execute(work_items, Date.parse("2013-01-03"), Date.parse("2013-01-04"))
				assert_hash_order_matters(chart_data, {"2013-1" => [3,2]})
			end
		end
	end
end