# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'ehb_game_lib/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ehb_game_lib'
  s.version     = EhbGameLib::VERSION
  s.authors     = ['Eduardo H. Bogoni']
  s.email       = ['eduardobogoni@gmail.com']
  s.summary     = 'EHB\'s game library for Ruby'

  s.files = Dir['{lib,test}/**/*']

  s.add_dependency 'activesupport', '>= 4.0.0'
  s.add_dependency 'chingu', '>= 0.8.1'
  s.add_dependency 'eac_ruby_utils', '~> 0.19'
  s.add_dependency 'gosu', '~> 0.13.1'
  s.add_dependency 'opengl'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop', '~> 0.79.0'
  s.add_development_dependency 'test-unit'
end
