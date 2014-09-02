# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = 'sqlite3-foreigner'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = 'Foreign Keys for Rails on SQLite3'
  s.description = 'Foreigner like FK migration for SQLite3'

  s.required_ruby_version     = '>= 1.9.2'
  s.required_rubygems_version = '>= 1.3.5'

  s.author            = 'Kazuhiro Sera'
  s.email             = 'seratch@gmail.com'
  s.homepage          = 'http://github.com/seratch/sqlite3-foreigner'

  s.files = %w(LICENSE.txt Rakefile README.md) + Dir['lib/**/*.rb']
  s.add_runtime_dependency 'foreigner'
end

