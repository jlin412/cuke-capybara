The purpose of this gem is create Test Framework to test web application using cucumber/capybara/ruby/rake.
The report of test will be generated in report/*.html
The junit result will be generated for CI server.

To setup:
# Install Ruby 1.9.x
# git clone ...
# cd cuke-capybara
# bundle install

To execute:
    local: rake cuke -app=demo
    cl: rake cuke -app=cl-demo

    If only a feature is required to execute, add -ftr=[feature name]
