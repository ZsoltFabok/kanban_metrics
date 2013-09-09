require 'spec_helper'

module KanbanMetrics
	module Commands
		describe Cfd do
			before(:each) do
				@work_item1 = WorkItem.new({:committed => "2013-01-02", :started => "2013-01-02", :finished => "2013-01-04", :delivered => "2013-01-05" })
			  @work_item2 = WorkItem.new({:committed => "2013-01-02", :started => "2013-01-03", :finished => "2013-01-05", :delivered => "2013-01-05" })
			end

			it "should create chart data for a work item" do
				chart_data = Cfd.new.execute([@work_item1])
				assert_hash_order_matters(chart_data, {Date.parse("2013-01-02") => [1,1,0,0], Date.parse("2013-01-04") => [1,1,1,0], Date.parse("2013-01-05") => [1,1,1,1]})
			end

			it "should create chart data for two work items" do
				chart_data = Cfd.new.execute([@work_item1, @work_item2])
				assert_hash_order_matters(chart_data, {Date.parse("2013-01-02") => [2,1,0,0], Date.parse("2013-01-03") => [2,2,0,0], Date.parse("2013-01-04") => [2,2,1,0], Date.parse("2013-01-05") => [2,2,2,2]})
			end

			it "should create chart data for a shorter range than the work items determine" do
				chart_data = Cfd.new.execute([@work_item1, @work_item2], Date.parse("2013-01-02"), Date.parse("2013-01-03"))
				assert_hash_order_matters(chart_data, {Date.parse("2013-01-02") => [2,1,0,0], Date.parse("2013-01-03") => [2,2,0,0]})
			end

			it "should create chart data for partial data set" do
				work_item1 = WorkItem.new({:committed => "2013-01-02", :started => "2013-01-02"})
				work_item2 = WorkItem.new({:committed => "2013-01-02", :started => "2013-01-03", :finished => "2013-01-05" })

				chart_data = Cfd.new.execute([work_item1, work_item2])
				assert_hash_order_matters(chart_data, {Date.parse("2013-01-02") => [2,1,0,0], Date.parse("2013-01-03") => [2,2,0,0], Date.parse("2013-01-05") => [2,2,1,0]})
			end
		end
	end
end