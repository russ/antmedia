lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'antmedia/version'

Gem::Specification.new do |spec|
  spec.name          = 'antmedia'
  spec.version       = Antmedia::VERSION
  spec.authors       = ['Russ Smith']
  spec.email         = ['russ@bashme.org']
  spec.summary       = 'Interface for the AntMedia server API'

  spec.files         = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency('oj', '~>3.0')
  spec.add_dependency('faraday', '~> 1.0')

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 6.0'
end
