module KanbanMetrics
	module Commands
		class Cfd
		  USED_ATTRIBUTES = [:committed, :started, :finished, :delivered]
			def execute(work_items, start = nil, end_ = nil)
				chart_data = create_empty_chart_data_with_all_the_dates(work_items)

				work_items.each do |work_item|
					USED_ATTRIBUTES.each_with_index do |attribute, index|
						chart_data.keys.select {|date| attribute_lg_date?(work_item, attribute, date)}.each do |entry|
							chart_data[entry][index] += 1
						end
					end
				end

				start = earliest_date(work_items) if start.nil?
				end_ = latest_date(work_items) if end_.nil?
				chart_data.select! do |date, values|
						start <= date && date <= end_
				end

				ChartDataHelper.sort(chart_data)
			end

			private
			def create_empty_chart_data_with_all_the_dates(work_items)
				chart_data = {}
				work_items.each do |work_item|
					USED_ATTRIBUTES.each do |attribute|
						date = work_item.send(attribute)
						if date != nil && chart_data[date] == nil
							chart_data[date] = [0, 0, 0, 0]
						end
					end
				end
				chart_data
			end

			def attribute_lg_date?(work_item, attribute, date)
				work_item.send(attribute) && date >= work_item.send(attribute)
			end

			def earliest_date(work_items)
				work_items.map {|work_item| work_item_dates(work_item)}.flatten.min
			end

			def latest_date(work_items)
				work_items.map {|work_item| work_item_dates(work_item)}.flatten.max
			end

			def work_item_dates(work_item)
				USED_ATTRIBUTES.map {|attribute| work_item.send(attribute)}.compact
			end
		end
	end
end