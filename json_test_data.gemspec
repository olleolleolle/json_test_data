# -*- encoding: utf-8 -*-
require_relative "./version"

Gem::Specification.new do |s|
  s.name                  = "json_test_data"
  s.version               = JsonTestData::VERSION
  s.authors               = ["Dana Scheider"]
  s.description           = "Generate test data from JSON schema"
  s.summary               = "json_test_data-#{s.version}"
  s.email                 = "dana.scheider@gmail.com"
  s.license               = "MIT"
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">= 2.1.0"

  s.add_dependency "regexp-examples", "~> 1.2"

  s.add_development_dependency "cucumber", "~> 2.1"
  s.add_development_dependency "rspec", "~> 3.4"
  s.add_development_dependency "json", "~> 1.7"
  s.add_development_dependency "json-schema", "~> 2.6"
  s.add_development_dependency "rake", "~> 11.0"
  s.add_development_dependency "coveralls", "~> 0.7"

  s.rubygems_version   = ">= 1.6.1"
  s.files              = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files         = `git ls-files -- {spec,features}/*`.split("\n")
  s.rdoc_options       = ["--charset=UTF-8"]
  s.require_path       = "lib"
end
