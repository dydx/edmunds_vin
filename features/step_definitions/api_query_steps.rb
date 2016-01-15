require_relative '../support/matchers/api_schema_matcher'
require_relative '../../lib/edmunds_vin'

When(/^I search for (.*)$/) do |vin|
  @vin_data ||= {}
  @decoder = EdmundsVin::Decoder.new(ENV['EDMUNDS_API_KEY'])
  @vin_data[vin] = @decoder.decode(vin)
end

Then(/^I should get back a JSON document$/) do
  expect(@vin_data['4T1BK1EB6DU05616']).to match_response_schema("vin_decode")
end
