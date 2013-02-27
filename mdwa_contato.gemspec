# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdwa_contato/version'

Gem::Specification.new do |gem|
  gem.name          = "mdwa_contato"
  gem.version       = MdwaContato::VERSION
  gem.authors       = ["Marcelo Theodoro"]
  gem.email         = ["contato@qw3.com.br"]
  gem.description   = %q{Faz o gerenciamento de contatos que entram em um site.}
  gem.summary       = %q{Gerenciador de contatos MDWA}
  gem.homepage      = "https://github.com/qw3/mdwa_contato"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
