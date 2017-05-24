# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edmunds_vin/version'

Gem::Specification.new do |spec|
  spec.name          = "edmunds_vin"
  spec.version       = Edmunds::VERSION
  spec.authors       = ["Joshua Sandlin"]
  spec.email         = ["joshua.sandlin@gmail.com"]

  spec.summary       = %q{Decode Vehicle Identification Numbers with the Edmunds API}
  spec.description   = %q{Decode Vehicle Identification Numbers with the Edmunds API}
  spec.homepage      = "https://github.com/dydx/edmunds_vin.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-json_expectations", "1.2.0"

  spec.add_dependency "httparty", ">= 0.13.1"

end
