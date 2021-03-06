# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eader/version'

Gem::Specification.new do |gem|
  gem.name          = "eader"
  gem.version       = Eader::VERSION
  gem.authors       = ["Joe Sak"]
  gem.email         = ["joe@joesak.com"]
  gem.description   = %q{Parse ead documents}
  gem.summary       = %q{Parse ead documents}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
end
