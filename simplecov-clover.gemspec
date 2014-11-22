# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov-clover/version'

Gem::Specification.new do |spec|
  spec.name          = "simplecov-clover"
  spec.version       = Simplecov::Clover::VERSION
  spec.authors       = ["Mikko Kokkonen"]
  spec.email         = ["mikko@mikian.com"]
  spec.summary       = %q{SimpleCov Formatter for Atlassian Bamboo}
  spec.description   = %q{Integrates SimpleCov results to be shown in Atlassian Bamboo}
  spec.homepage      = "https://github.com/mikian/simplecov-clover"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri",  "~> 1.6.4.1"
  spec.add_dependency "simplecov", "~> 0.9"
  spec.add_dependency "simplecov-rcov", "~> 0.2.3"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
