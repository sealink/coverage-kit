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

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "simplecov"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov-rcov"
  spec.add_development_dependency "coveralls"
end
