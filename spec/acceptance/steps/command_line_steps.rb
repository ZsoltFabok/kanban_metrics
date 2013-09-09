require "spec_helper"

module CommandLineSteps
  step "the line in :filename :line" do |filename, line|
  	File.open(filename, 'a') do |file|
    	file.puts line
  	end
  end

  step "I run the command :command" do |command|
    @output = exec(command)
  end

  step "I see :output" do |output|
    @output.should eql(output.split('\n'))
  end

  step "I delete :filename" do |filename|
  	FileUtils.rm_f(filename)
  end
end

RSpec.configure { |c| c.include CommandLineSteps }