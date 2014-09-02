# Foreigner extension for SQLite3 users

## Foreginer

https://github.com/matthuhiggins/foreigner

## Setup

https://rubygems.org/gems/sqlite3-foreigner

## Gemfile

```ruby
gem 'foreigner'
gem 'sqlite3-foreigner'
```

### config/initializers/sqlite3_foreigner.rb

```ruby
require 'foreigner/connection_adapters/sqlite3_adapter'
Foreigner::Adapter.register 'sqlite3', 'foreigner/connection_adapters/sqlite3_adapter'
```

## License

The MIT License

