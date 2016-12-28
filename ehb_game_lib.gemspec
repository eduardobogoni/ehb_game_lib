$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ehb_game_lib/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ehb_game_lib'
  s.version     = EhbGameLib::VERSION
  s.authors     = ['Eduardo H. Bogoni']
  s.email       = ['eduardobogoni@gmail.com']
  s.summary     = 'EHB\'s game library for Ruby'

  s.files = Dir['{lib}/**/*']

  s.add_dependency 'chingu', '>= 0.8.1'

  s.add_development_dependency 'rubocop', '0.42.0'
end
