# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'news-api-ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'config_czar'
  spec.version = NewsApi::VERSION
  spec.authors = ['Vinnie Vendemia']
  spec.email = ['vvendemia1@gmail.com']
  spec.summary = 'Wrapper for hitting the newsapi.org API'
  spec.description = 'Wrapper for hitting the newsapi.org API'
  spec.homepage = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'faraday', '~> 11.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.47'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'rspec'
end
