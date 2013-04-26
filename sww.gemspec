# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sww/version'

Gem::Specification.new do |gem|
  gem.name          = "sww"
  gem.version       = Sww::VERSION
  gem.authors       = ["Rob Westgeest"]
  gem.email         = ["rob@qwan.it"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""
  gem.add_dependency "xmpp4r"
  gem.add_development_dependency "rspec", "~> 2"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rb-inotify", "~> 0.8.8"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
