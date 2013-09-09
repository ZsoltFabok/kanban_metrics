require 'spec_helper'

module KanbanMetrics
	module Commands
		describe LeadtimeView do
			it "should print out the chart data in csv" do
				chart_data = {2 => 3, 3 => 4}

				STDOUT.should_receive(:puts).with("2,3")
				STDOUT.should_receive(:puts).with("3,4")

				LeadtimeView.new.render(chart_data)
			end
		end
	end
end