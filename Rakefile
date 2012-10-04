#require 'fileutils'
require 'cucumber/rake/task'
require 'launchy'
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

  unless File.exist? ENV['RESULT_DIR']
    FileUtils.mkdir("report")
  end
  unless File.exist? ENV['JUNIT_DIR']
    FileUtils.mkdir("junit")
  end

    Rake::Task[:features].execute
  Launchy.open("report/report.html")
end
