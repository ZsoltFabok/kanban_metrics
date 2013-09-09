require 'spec_helper'

module KanbanMetrics
	module Commands
		describe Leadtime do
			before(:each) do
				@work_item1 = WorkItem.new({:committed => "2013-01-02", :delivered => "2013-01-05" })
				@work_item2 = WorkItem.new({:committed => "2013-01-02", :delivered => "2013-01-02" })
				@work_item3 = WorkItem.new({:committed => "2013-01-02", :delivered => "2013-01-04" })
			end

			it "should return distribution" do
				work_items = [@work_item1, @work_item2, @work_item3]
				chart_data = Leadtime.new.execute(work_items)
				assert_hash_order_matters(chart_data, {1=>1, 3 => 2})
			end

			it "should leave out unfinished items from chart_data" do
				work_item2 = WorkItem.new({:committed => "2013-01-02" })
				work_items = [@work_item1, work_item2, @work_item3]
				chart_data = Leadtime.new.execute(work_items, Date.parse("2013-01-02"), Date.parse("2013-01-05"))
				assert_hash_order_matters(chart_data, {3 => 2})
			end
		end
	end
end
