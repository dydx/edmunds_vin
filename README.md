# EdmundsVin

[![Build Status](https://travis-ci.org/dydx/edmunds_vin.svg?branch=master)](https://travis-ci.org/dydx/edmunds_vin)

`EdmundsVin` is an API wrapper for the Edmunds API that returns a JSON document
containing a given vehicles information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edmunds_vin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edmunds_vin

## Usage

1. `require 'edmunds_vin'`
2. `decoder = Edmunds::Vin.new(<API KEY>)`
3. `full_car_data = decoder.full(<17-DIGIT VIN>)`
4. `basic_car_data = decoder.basic(<17-DIGIT VIN>)`

>*NoteL* `response` is a JSON document 

## Edmunds Developer API

For information about the Edmunds Developer API, visit http://developer.edmunds.com.

I am not affiliated with Edmunds, and I do not hold any responsibility for your developers agreement with them.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

