require "edmunds_vin/version"
require 'net/http'
require 'json'

module EdmundsVin

  class Decoder

    def initialize(key)
      raise ArgumentError unless !key.empty?
      @key = key
      @format = 'json'
    end

    def decode(vin)
      raise ArgumentError unless vin.length == 17
      query_url = URI("https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=#{@format}&api_key=#{@key}")
      response = Net::HTTP.get(query_url)
      response
    end

  end

end
