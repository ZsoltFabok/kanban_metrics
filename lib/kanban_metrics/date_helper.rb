module KanbanMetrics
  class DateHelper
    def self.weekdays_in_date_range(range)
      weekdays_only(range).size
    end

    private
    def self.weekdays_only(range)
      range.select { |d| (1..5).include?(d.wday) }
    end
  end
end
