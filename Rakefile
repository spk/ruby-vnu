require 'rdoc/task'
require 'rake/testtask'

task default: [:test]

RDoc::Task.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md", "lib/**/*.rb")
end

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
end
task spec: :test
