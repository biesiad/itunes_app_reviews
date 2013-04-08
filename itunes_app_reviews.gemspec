# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itunes_app_reviews/version'

Gem::Specification.new do |gem|
  gem.name          = "itunes_app_reviews"
  gem.version       = ITunesAppReviews::VERSION
  gem.authors       = ["Grzegorz Biesiadecki"]
  gem.email         = ["gbiesiadecki@gmail.com"]
  gem.description   = %q{Scrapes iTunes for app reviews}
  gem.summary       = %q{iTunes App Reviews}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
