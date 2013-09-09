require 'spec_helper'

module KanbanMetrics
	module Commands
		describe IoView do
			it "should print out the chart data in csv" do
				chart_data = {"2013-01" => [1,0], "2013-02" => [1,1]}

				STDOUT.should_receive(:puts).with("week, in, out")
				STDOUT.should_receive(:puts).with("2013-01,1,0")
				STDOUT.should_receive(:puts).with("2013-02,1,1")

				IoView.new.render(chart_data)
			end
		end
	end
end