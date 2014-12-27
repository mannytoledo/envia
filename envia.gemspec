# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'envia/version'

Gem::Specification.new do |spec|
  spec.name          = "envia"
  spec.version       = Envia::VERSION
  spec.authors       = ["Manny Toledo"]
  spec.email         = ["manny.toledo@gmail.com"]
  spec.summary       = %q{Upload a file and generate a URL to share}
  spec.description   = %q{You can optionally upload a file to S3 and then request the url with expiry from when you can download it}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'aws-sdk-core', '~> 2.0.6'
  spec.add_dependency 'thor'

  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'aruba'
end
