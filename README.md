# EdmundsVin

[![Build Status](https://travis-ci.org/dydx/edmunds_vin.svg?branch=master)](https://travis-ci.org/dydx/edmunds_vin)

`EdmundsVin` is an API wrapper for the Edmunds API that returns a JSON document
containing a given vehicles information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edmunds_vin', :github => 'dydx/edmunds_vin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edmunds_vin

## Usage

1. `require 'edmunds_vin'`
2. `decoder = EdmundsVin::Decoder.new(<API KEY>)`
3. `response = decoder.decode(<17-DIGIT VIN>)`

>*NoteL* `response` is a JSON document 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

