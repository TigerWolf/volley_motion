require "volley_motion/version"

module VolleyMotion

  class Config
    def initialize(config)
      @config = config
      create_listeners
    end

    def create_listeners
      files_created = false

      request_listener = <<EOF
# This file is automatically generated. Do not edit.

module VolleyMotion
  class RequestListener
    attr_accessor :activity, :responder

    def initialize(activity, responder)
      @activity = activity
      @responder = responder
    end

    def onResponse(json)
      responder = @responder.new(json)
      responder.on_response(@activity)
    end

  end
end

EOF
      require 'fileutils'
      FileUtils::mkdir_p './app/volley_listeners/'

      request_listener_file = './app/volley_listeners/request_listener.rb'
      if !File.exist?(request_listener_file) or File.read(request_listener_file) != request_listener
        File.open(request_listener_file, 'w') { |io| io.write(request_listener) }
        files_created = true
      end

      error_listener = <<EOF
# This file is automatically generated. Do not edit.

module VolleyMotion
  class ErrorListener

    attr_accessor :activity

    def initialize(activity)
      @activity = activity
    end

    def onErrorResponse(error)
      error_result = { :error => :network_error, :message => "Network error."}
      case error.class.toString
      when "class com.android.volley.AuthFailureError"
        error_result = { :error => :auth_failure, :message => "Authentication Failure."}
      when "class com.android.volley.NoConnectionError"
        error_result = { :error => :no_connection, :message => "No connection."}
      end
      @activity.error_response(error_result)
    end

  end
end

EOF

      error_listener_file = './app/volley_listeners/error_listener.rb'
      if false && !File.exist?(error_listener_file) or File.read(error_listener_file) != error_listener
        File.open(error_listener_file, 'w') { |io| io.write(error_listener) }
        files_created = true
      end

      if files_created == true
        abort("Volley Listeners created: Please run rake again")
      end

    end
  end

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

module Motion; module Project; class AndroidConfig
  def volley
     @volley ||= VolleyMotion::Config.new(self)
  end
end; end; end

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

$:.unshift("./volley_motion/")
require 'volley_motion/version'

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'volley_motion/**/*.rb')).each do |file|
    app.files << file
  end

  app.vendor_project jar: File.join(File.dirname(__FILE__), '../vendor/volley/volley-1.0.15.jar')
end
