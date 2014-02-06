# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sperm/version'

Gem::Specification.new do |spec|
  spec.name          = 'sperm'
  spec.version       = Sperm::VERSION

  spec.author        = 'Arthur Khashaev'
  spec.email         = 'arthur@khashaev.ru'

  spec.summary       = 'Sperm is an efficient random permutations generator'
  spec.description   = 'Sperm is a random permutations generator ' \
                       'based on the ideas of group theory ' \
                       'that allows you to generate stupendous permutations ' \
                       'without extra memory consumption.'

  spec.homepage      = 'https://github.com/Invizory/sperm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', "~> 1.5"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
