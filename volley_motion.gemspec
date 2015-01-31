# This is just so that the source file can be loaded.
module ::Motion; module Project; class Config
  def self.variable(*); end
end; end; end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volley_motion/version'

Gem::Specification.new do |spec|
  spec.name          = "volley_motion"
  spec.version       = VolleyMotion::VERSION
  spec.authors       = ["TigerWolf"]
  spec.email         = ["hiddentiger@gmail.com"]
  spec.summary       = %q{Volley Android Library for RubyMotion }
  spec.description   = %q{A gem to add the Volley Library to your RubyMotion Android Project.}
  spec.homepage      = "https://github.com/TigerWolf/volley_motion"
  spec.license       = "MIT"
  spec.files         = Dir['Rakefile', '{bin,lib,man,test,spec,vendor}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
