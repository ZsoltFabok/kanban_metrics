module KanbanMetrics
	module Commands
		class Io
			def execute(work_items, start = nil, end_ = nil)
				chart_data = {}
				work_items.each do |work_item|

          if work_item.started
            in_ = "#{work_item.started.year}-#{work_item.started.cweek}"
            if chart_data[in_].nil?
              chart_data[in_] = [0, 0]
            end
            chart_data[in_][0] += 1
          end

          if work_item.delivered
            out = "#{work_item.delivered.year}-#{work_item.delivered.cweek}"
            if chart_data[out].nil?
              chart_data[out] = [0, 0]
            end
            chart_data[out][1] += 1
          end
				end
				start = earliest_started(work_items) if start.nil?
				end_ = latest_delivered(work_items) if end_.nil?
				start_cweek = "#{start.year}-#{start.cweek}"
				end_cweek =  "#{end_.year}-#{end_.cweek}"

				chart_data.select! do |date, values|
						start_cweek <= date && date <= end_cweek
				end

				ChartDataHelper.sort(chart_data)
			end

			private
			def earliest_started(work_items)
				work_items.select{|work_item| work_item.started}.map {|work_item| work_item.started}.min
			end

			def latest_delivered(work_items)
				work_items.select{|work_item| work_item.delivered}.map {|work_item| work_item.delivered}.max
			end
		end
	end
end