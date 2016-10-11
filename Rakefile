require 'sinatra/asset_pipeline/task'
require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'
require './application'

Sinatra::AssetPipeline::Task.define! SinatraBasis


task :default => :test
task :test => :spec

if !defined?(RSpec)
  puts "spec targets require RSpec"
else
  desc "Run all tests"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir['spec/**/*_spec.rb']
  end
end

task :console do
  desc "Run Sinatra console (tux)"
  ruby 'script/console'
end