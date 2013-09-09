require 'date'

module KanbanMetrics
  class WorkItem
    attr_accessor :id, :committed, :started, :finished, :delivered, :type, :back_count, :estimated_time, :spent_time

    def initialize(map)
      map.each do |key, value|
      	eval("@#{key}=\"#{value}\"")
    		# this didn't work: eval("@#{key}=\"#{Date.parse(value)}\"")
    		if key == :committed && @committed
    			@committed = Date.parse(@committed)
    		elsif key == :started && @started
    			@started = Date.parse(@started)
    		elsif key == :finished && @finished
    			@finished = Date.parse(@finished)
    		elsif key == :delivered && @delivered
    			@delivered = Date.parse(@delivered)
    		end
      end
    end
  end
end
