require "volley_motion/version"

module VolleyMotion

  class Methods
    DEPRECATED_GET_OR_POST = -1
    GET = 0
    POST = 1
    PUT = 2
    DELETE = 3
    HEAD = 4
    OPTIONS = 5
    TRACE = 6
    PATCH = 7
  end

end

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

$:.unshift("./volley_motion/")
require 'volley_motion/request_listener'
require 'volley_motion/error_listener'
require 'volley_motion/array_request'
require 'volley_motion/version'

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'volley_motion/**/*.rb')).each do |file|
    app.files << file
  end

  app.vendor_project jar: File.join(File.dirname(__FILE__), '../vendor/volley/volley-1.0.10.jar')
end


