require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "litmus"
    gem.summary = %Q{A wrapper to the Litmus customer API}
    gem.description = %Q{A wrapper to the Litmus customer API}
    gem.email = "mail@matthewfawcett.co.uk"
    gem.homepage = "http://github.com/mattfawcett/litmus"
    gem.authors = ["Matt Fawcett"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency 'httparty', ">= 0.6.1"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# require 'rspec/core'
# require 'rspec/core/rake_task'
# RSpec::Core::RakeTask.new(:spec) do |spec|
#   spec.pattern = 'spec/**/*_spec.rb'
# end
#
# RSpec::Core::RakeTask.new(:rcov) do |spec|
#   spec.pattern = 'spec/**/*_spec.rb'
#   spec.rcov = true
# end

task :spec => :check_dependencies

task :default => :spec
#
# require 'rake/rdoctask'
# Rake::RDocTask.new do |rdoc|
#   version = File.exist?('VERSION') ? File.read('VERSION') : ""
#
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title = "litmus #{version}"
#   rdoc.rdoc_files.include('README*')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end
