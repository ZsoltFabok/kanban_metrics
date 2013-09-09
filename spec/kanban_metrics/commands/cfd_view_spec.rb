require 'spec_helper'

module KanbanMetrics
	module Commands
		describe CfdView do
			it "should print out the chart data in csv" do
				chart_data = {Date.parse("2013-01-01") => [1,0,0,0], Date.parse("2013-01-02") => [1,1,0,0]}

				STDOUT.should_receive(:puts).with("2013-01-01,1,0,0,0")
				STDOUT.should_receive(:puts).with("2013-01-02,1,1,0,0")

				CfdView.new.render(chart_data)
			end
		end
	end
end