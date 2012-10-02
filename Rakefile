#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'fileutils'
require 'cucumber/rake/task'
require 'launchy'
#ENV['RESULT_DIR'] = File.dirname(__FILE__) + '/report'
#puts ENV['RESULT_DIR']

Cucumber::Rake::Task.new(:features) do |t|
  #t.fork = false # You may get faster startup if you set this to false
  t.profile = ENV['app']
  #t.cucumber_opts = "-f pretty"
  if  ENV['ftr'] == nil then
    t.cucumber_opts = "features -f html --out=report/report.html"
  else
    t.cucumber_opts = "features/#{ENV['ftr']} -f html --out=report/report.html"
  end
end

#task :feature do |task|
#  puts ENV['feature']
#  cuke_task.cucumber_opts = "features/#{ENV['feature']}"
#  Rake::Task[:features].execute
#
#end

task :cuke do |task|

  Rake::Task[:features].invoke

  Launchy.open("report.html")
end
