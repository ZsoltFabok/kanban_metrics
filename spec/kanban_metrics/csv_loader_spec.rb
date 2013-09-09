require 'spec_helper'

module KanbanMetrics
	describe CsvLoader do
		it "should load work items from csv file" do
			filename = "dummy.csv"
			CSV.stub(:foreach).with(filename, {:force_quotes => true, :headers => true}).and_yield(
				CSV::Row.new(["id","committed","done", "back count"],[], true)).and_yield(
				CSV::Row.new(["id","committed","done", "back count"],["2", "2013-01-01", "2013-01-02", "0"], false))

			work_items = CsvLoader.new.load(filename)

			work_items.size.should eql(1)
			work_items[0].committed.should eql(Date.parse("2013-01-01"))
			work_items[0].back_count.should eql("0")
		end

		it "should skip empty cells" do
			filename = "dummy.csv"
			CSV.stub(:foreach).with(filename, {:force_quotes => true, :headers => true}).and_yield(
				CSV::Row.new(["id","committed","done", "back count"],[], true)).and_yield(
				CSV::Row.new(["id","committed","done", "back count"],["2", "", "2013-01-02", "0"], false))

			work_items = CsvLoader.new.load(filename)
			work_items[0].committed.should be_nil
		end
	end
end