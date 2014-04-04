# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idobata/version'

Gem::Specification.new do |spec|
  spec.name          = "idobata"
  spec.version       = Idobata::VERSION
  spec.authors       = ["asonas"]
  spec.email         = ["hzw1258@gmail.com"]
  spec.description   = %q{idobata is content free chat}
  spec.summary       = %q{Ruby bindings of Idobata}
  spec.homepage      = "https://github.com/asonas/idobata-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday', '~> 0.8.8'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.0"
end
