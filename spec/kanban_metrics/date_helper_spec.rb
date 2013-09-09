require 'spec_helper'

module KanbanMetrics
	describe DateHelper do
		it "should return the number of weekdays (no weekends)" do
			days = DateHelper.weekdays_in_date_range(Date.parse("2013-01-01")..Date.parse("2013-01-08"))
			days.should eql(6)
		end
	end
end