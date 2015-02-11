require "bundler/gem_tasks"
require "bundler/setup"
Bundler.require
require "pathname"
path = Pathname.new(__FILE__).realpath
$:.unshift File.expand_path("../lib", path)
require "sub_converter"

task :test do
  require "minitest/autorun"

  $:.unshift File.expand_path("../", path)

  Dir["test/*_test.rb"].each{|f| require f }
end
