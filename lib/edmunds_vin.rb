require "edmunds_vin/version"
require 'net/http'

# VIN
#
# Format
# API Key
#
# https://api.edmunds.com/api/vehicle/v2/vins/{car VIN}?manufactureCode={manufacturer code}&fmt=json&api_key={api key}

module EdmundsVin
  class Decoder
    def initialize(key)
      @key = key
      @format = 'json'
    end

    def decode(vin)
      query_url = URI("https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=#{@format}&api_key=#{@key}")
      Net::HTTP.get(query_url)
    end
  end
end
