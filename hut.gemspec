# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hut/version'

Gem::Specification.new do |spec|
  spec.name          = "hut"
  spec.version       = Hut::VERSION
  spec.authors       = ["Ryan Lower"]
  spec.email         = ["rpjlower@gmail.com"]
  spec.description   = %q{Terminal campfire client}
  spec.summary       = %q{Terminal campfire client}
  spec.homepage      = "https://github.com/ryanlower/hut"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "highline"
  spec.add_dependency "open4"
  spec.add_dependency "tinder"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
