require "edmunds_vin/version"
require 'net/http'
require 'json'

# VIN
#
# Format
# API Key

module EdmundsVin
  class Decoder
    def initialize(key)
      @key = key
      @format = 'json'
    end

    def decode(vin)
      query_url = URI("https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=#{@format}&api_key=#{@key}")
      response = Net::HTTP.get(query_url)
      response
    end
  end
end
