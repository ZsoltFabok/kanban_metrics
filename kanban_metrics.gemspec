# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'kanban_metrics/version'

Gem::Specification.new do |s|
  s.name        = 'kanban_metrics'
  s.version     = KanbanMetrics::VERSION
  s.date        = '2013-09-09'
  s.summary     = "kanban_metrics-#{s.version}"
  s.description = "A simple tool for processing data from the Kanban board (in csv) and providing metrics"
  s.authors     = ["Zsolt Fabok"]
  s.email       = 'me@zsoltfabok.com'
  s.homepage    = 'https://github.com/ZsoltFabok/kanban_metrics'
  s.license     = 'GPLv3'

  s.files         = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ || path =~ /file$/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec', '~> 2.12')
  s.add_development_dependency('turnip', '~> 1.2.0')
  s.add_development_dependency('rake', '>= 10.0.3')
  s.add_development_dependency('simplecov', '>= 0.7.1')
end
