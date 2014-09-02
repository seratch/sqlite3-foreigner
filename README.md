# Foreigner extension for SQLite3 users

## Foreginer

https://github.com/matthuhiggins/foreigner

## Setup

## Gemfile

```
gem 'foreigner'
gem 'sqlite3-foreigner'
```

### config/initializers/sqlite3_foreigner.rb

```
require 'foreigner/connection_adapters/sqlite3_adapter'
Foreigner::Adapter.register 'sqlite3', 'foreigner/connection_adapters/sqlite3_adapter'
```

## License

The MIT License

