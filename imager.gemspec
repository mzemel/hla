# encoding: utf-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'hla/version'

Gem::Specification.new do |s|
  s.name        = 'happy_little_accidents'
  s.version     = HLA::VERSION
  s.summary     = 'score an image for prettiness'

  s.description = <<-DESCRIPTION
  Image scorer
  DESCRIPTION

  s.authors    = ['Michael Zemel', 'Lucas Charles']
  s.email       = 'lucas@househappy.org'
  s.license     = 'MIT'
  s.homepage    = 'http://github.com/househappy/happy_little_accidents'

  s.files       = `git ls-files`.split($/)
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split($/)
  s.executables = s.files.grep(/^bin\//) { |f| File.basename(f) }

  s.require_paths = ['lib']

  # dependencies
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'ruby-vips'
  s.add_development_dependency 'miro'
end
