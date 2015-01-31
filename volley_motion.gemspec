# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volley_motion/version'
# require File.expand_path('../lib/volley_motion/version', __FILE__)
# require File.expand_path('../lib/volley_motion/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "volley_motion"
  spec.version       = "0.0.1" #VolleyMotion::VERSION
  spec.authors       = ["TigerWolf"]
  spec.email         = ["hiddentiger@gmail.com"]
  spec.summary       = %q{Volley Android Library for RubyMotion }
  spec.description   = %q{A gem to add the Volley Library to your RubyMotion Android Project.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.files       = Dir.glob('lib/**/*.rb') << 'README.md' << 'LICENSE.txt'

  # spec.add_dependency "motion-require", ">= 0.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
