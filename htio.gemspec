require_relative './lib/htio/version'

Gem::Specification.new do |s|
  s.name        = 'htio'
  s.version     = Htio::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'Htio - a modern HTTP client for Ruby'
  s.author      = 'Sharon Rosner'
  s.email       = 'sharon@noteflakes.com'
  s.files       = `git ls-files`.split
  s.homepage    = 'http://github.com/digital-fabric/htio'
  s.metadata    = {
    "source_code_uri" => "https://github.com/digital-fabric/htio"
  }
  s.rdoc_options = ["--title", "htio", "--main", "README.md"]
  s.extra_rdoc_files = ["README.md"]
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.6'

  s.add_runtime_dependency      'polyphony',          '~>0.57.0'
  
  s.add_runtime_dependency      'http_parser.rb',     '~>0.6.0'
  s.add_runtime_dependency      'http-2',             '~>0.10.0'

  s.add_development_dependency  'rake',               '~>12.3.3'
  s.add_development_dependency  'localhost',          '~>1.1.4'
  s.add_development_dependency  'minitest',           '~>5.11.3'
  s.add_development_dependency  'minitest-reporters', '~>1.4.2'
  s.add_development_dependency  'simplecov',          '~>0.17.1'
end
