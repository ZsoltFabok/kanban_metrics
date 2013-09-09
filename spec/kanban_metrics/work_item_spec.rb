require 'spec_helper'

module KanbanMetrics
  describe WorkItem do

    before(:each) do
      @work_item = WorkItem.new({:id => "id", :committed => "2011-05-18", :started => "2011-05-20", :finished => "2011-05-20", :type => "type"})
    end

    describe "#create" do
      it "should store every detail" do
        @work_item.id.should eql('id')
        @work_item.committed.should eql(Date.parse('2011-05-18'))
        @work_item.started.should eql(Date.parse('2011-05-20'))
        @work_item.finished.should eql(Date.parse('2011-05-20'))
        @work_item.type.should eql('type')
      end
    end
  end
end
