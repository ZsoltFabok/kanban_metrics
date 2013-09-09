module KanbanMetrics
	module Commands
		class IoView
			def render(chart_data)
				puts "week, in, out"
				chart_data.keys.each do |cweek|
					puts "#{cweek},#{chart_data[cweek].join(',')}"
				end
			end
		end
	end
end