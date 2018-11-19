# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idobata_hook/version'

Gem::Specification.new do |spec|
  spec.name          = "idobata_hook"
  spec.version       = IdobataHook::VERSION
  spec.authors       = ["fukayatsu"]
  spec.email         = ["fukayatsu@gmail.com"]
  spec.summary       = %q{A client for Idobata's Generic Hook}
  spec.description   = %q{A client for Idobata's Generic Hook}
  spec.homepage      = "https://github.com/fukayatsu/idobata_hook"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'mime-types'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'coveralls'
end
