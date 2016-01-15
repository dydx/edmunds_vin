# EdmundsVin

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/edmunds_vin`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

