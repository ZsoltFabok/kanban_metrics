require 'kanban_metrics'
require 'rspec'

begin
  require "debugger"
rescue LoadError
  # most probably using 1.8
  require "ruby-debug"
end

require 'open3'
def exec(command)
  stdin, stdout, stderr = Open3.popen3("#{command}")
  error = stderr.readlines.map {|line| line.chomp}.join("\n")
  raise error unless error.empty?
  stdout.readlines.map {|line| line.gsub(/\n/,"")}
end

def assert_hash_order_matters(hash1, hash2)
	hash1.keys.to_a.flatten.should eql(hash2.keys.to_a.flatten)
	hash1.should eql(hash2)
end

def fs_test_path
"test_data_public"
end