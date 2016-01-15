require_relative '../../lib/edmunds_vin'
require 'rspec/json_expectations'

When(/^I search for (.*)$/) do |vin|
  @vin = vin
  @vin_data ||= {}
  @decoder = EdmundsVin::Decoder.new(ENV['EDMUNDS_API_KEY'])
  @vin_data[@vin] = @decoder.decode(@vin)
end

Then(/^I should get back a JSON document$/) do
  expect(@vin_data[@vin]).to include_json(
    "squishVin": "4T1BK1EBDU"
  )
end
