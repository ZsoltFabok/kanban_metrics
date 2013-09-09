module KanbanMetrics
	module Commands
		class LeadtimeView
			def render(chart_data)
				chart_data.keys.each do |lead_time|
					puts "#{lead_time},#{chart_data[lead_time]}"
				end
			end
		end
	end
end