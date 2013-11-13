#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'fileutils'
require 'cucumber/rake/task'
require 'launchy'
require File.expand_path('../config/application', __FILE__)

IntentPizza::Application.load_tasks


ENV['RESULT_DIR'] = File.dirname(__FILE__) + '/report'
ENV['JUNIT_DIR'] = File.dirname(__FILE__) + '/junit'
#puts ENV['RESULT_DIR']

Cucumber::Rake::Task.new(:features) do |t|
  t.fork = true # You may get faster startup if you set this to false
  t.profile = ENV['app']
                #t.cucumber_opts = "-f pretty"
  if  ENV['ftr'] == nil then
    t.cucumber_opts = "features -f html --out=report/report.html"
  else
    t.cucumber_opts = "features/#{ENV['ftr']} -f html --out=report/report.html"
  end
end

task :cuke do |task|

  if File.exist? ENV['RESULT_DIR']
    FileList["#{ENV['RESULT_DIR']}/*.html"].each {|x| File.delete(x)}
  else
    FileUtils.mkdir("report")
  end
  if File.exist? ENV['JUNIT_DIR'] then
    FileList["#{ENV['JUNIT_DIR']}/*.xml"].each {|x| File.delete(x)}
  else
    FileUtils.mkdir("junit")
  end

  Rake::Task['db:reset'].invoke
  # call rails s
  system("osascript -e 'tell application \"Terminal\" to do script \"cd intent_pizza_no_git_rake;rvm --default use 1.9.3; rails s\" in selected tab of the front window'")

  #sleep(15) # to insure rails server is up properly

  Rake::Task[:features].invoke
  Launchy.open("report/report.html")
end

