lib = File.expand_path('../lib', __FILE__)
# coding: utf-8
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coverage/kit/version'

Gem::Specification.new do |spec|
  spec.name          = "coverage-kit"
  spec.version       = Coverage::Kit::VERSION
  spec.authors       = ["Michael Noack"]
  spec.email         = ["support@travellink.com.au"]

  spec.summary       = %q{Helper to setup good coverage for tests}
  spec.description   = %q{Helper to setup good coverage for tests}
  spec.homepage      = "https://github.com/sealink/coverage-kit"
  spec.license       = "MIT"

  spec.files = Dir["CHANGELOG.md", "README.md", "coverage-kit.gemspec", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "simplecov"
  spec.add_dependency "simplecov-lcov"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov-lcov"
end
