module KanbanMetrics
	module Commands
		class Leadtime
			def execute(work_items, start = nil, end_ = nil)
				chart_data = {}
				start = earliest_committed(work_items) if start.nil?
				end_ = latest_delivered(work_items) if end_.nil?
				work_items.each do |work_item|
					if work_item_finished?(work_item) && work_item_delivered_in_time_frame?(work_item, start, end_)
						work_item_life_period = work_item.committed..work_item.delivered
						lead_time = DateHelper.weekdays_in_date_range(work_item_life_period)

						if chart_data[lead_time] == nil
							chart_data[lead_time] = 0
						end

						chart_data[lead_time] += 1
					end
				end
				ChartDataHelper.sort(chart_data)
			end

			private
			def work_item_finished?(work_item)
				work_item.committed && work_item.delivered
			end

			def work_item_delivered_in_time_frame?(work_item, start, end_)
				start <= work_item.delivered && work_item.delivered <= end_
			end

			def earliest_committed(work_items)
				work_items.map {|work_item| work_item.committed}.compact.min
			end

			def latest_delivered(work_items)
				work_items.map {|work_item| work_item.delivered}.compact.max
			end
		end
	end
end