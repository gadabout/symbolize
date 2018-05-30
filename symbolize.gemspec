lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'symbolize/version'

Gem::Specification.new do |s|
  s.name        = 'symbolize'
  s.version     = Symbolize::VERSION

  s.authors     = ['Marcos Piccinini', 'Chris Dosé']
  s.description = 'Mongoid enums with i18n'
  s.homepage    = 'http://github.com/gadabout/symbolize'
  s.summary     = 'Object enums with i18n in Mongoid'
  s.email       = 'chris@peek.com'
  s.license     = 'MIT'

  s.files = Dir.glob('{lib,spec}/**/*') + %w(README.md Rakefile)
  s.require_path = 'lib'

  s.add_dependency 'i18n'
  s.add_dependency 'activemodel'
  s.add_dependency 'activesupport'
  s.add_dependency 'mongoid'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'mongoid'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '>= 3'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rubocop'
end
