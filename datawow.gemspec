# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'datawow'
  s.version       = '1.2.0'
  s.date          = '2018-11-27'
  s.summary       = 'HTTP RESTFul for calling DataWow APIs'
  s.description   = 'Moderation suite'
  s.post_install_message = File.read('INSTALL.md') if File.exist?('INSTALL.md')
  s.authors       = ['Jesdakorn Samittiauttakorn']
  s.email         = 'ton@nanameue.jp'
  s.files         = `git ls-files`.split("\n")
  s.homepage      = 'https://datawow.io'
  s.license       = 'Commercial'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'faraday',            '~> 0.13.1', '>= 0.13.1'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.12.2', '>= 0.12.2'
  s.add_runtime_dependency 'json',               '~> 1.8',    '>= 1.8.3'
  s.add_development_dependency 'minitest',       '~> 5.11', '>= 5.11.3'
  s.add_development_dependency 'pry-byebug',     '~> 3.6'
  s.add_development_dependency 'rake',           '~> 12.3'
  s.add_development_dependency 'simplecov',      '~> 0.15.1'
  s.add_development_dependency 'webmock',        '~> 3.3'
end
