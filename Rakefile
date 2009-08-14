require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "agnostic_presenters"
    gem.summary = %Q{Agnostic Presenters}
    gem.email = "dev@yeastymobs.com"
    gem.homepage = "http://github.com/yeastymobs/agnostic_presenters"
    gem.authors = ["Nicolas Mérouze"]
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

desc 'Default: run specs.'
task :default => :spec

desc 'Run all the specs for the machinist plugin.'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = false
end