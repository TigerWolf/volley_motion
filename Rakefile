require "bundler/gem_tasks"

RM_VERSION = "3.3"
unless File.exist?("/Library/RubyMotion#{RM_VERSION}/lib")
  abort "Couldn't find RubyMotion #{RM_VERSION}. Run `sudo motion update --cache-version=#{RM_VERSION}`."
end
$:.unshift("/Library/RubyMotion#{RM_VERSION}/lib")
require 'motion/project/template/android'
require 'bundler'
Bundler.require(:development)

$:.unshift("./lib/")
require './lib/volley_motion'

Motion::Project::App.setup do |app|

end
