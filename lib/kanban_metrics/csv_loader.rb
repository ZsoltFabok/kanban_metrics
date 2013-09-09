module KanbanMetrics
  class CsvLoader
  	def load(csv_file)
  		work_items = []
  		CSV.foreach(csv_file, {:force_quotes => true, :headers => true}) do |row|
  			unless row.header_row?
          data = {}
          row.headers.each do |header|
            if (row[header] && !row[header].empty?)
              data[header.sub(" ", "_").to_sym] = row[header]
            end
          end
  				work_items << WorkItem.new(data)
        end
  		end
  		work_items
  	end
  end
end