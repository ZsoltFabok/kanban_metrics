module KanbanMetrics
	module Commands
		class CfdView
			def render(chart_data)
				chart_data.each do |date, values|
					puts "#{date},#{values.join(',')}"
				end
			end
		end
	end
end