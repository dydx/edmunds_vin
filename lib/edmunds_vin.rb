require "edmunds_vin/version"
require 'net/http'
require 'json'

VinData = Struct.new(:make, :model, :year, :engine, :transmission, :fuel)
VinParser = -> raw {
  VinData.new(
    raw['make']['name'],
    raw['model']['name'],
    raw['years'][0]['year'],
    {
      'type' => raw['engine']['name'],
      'code' => raw['engine']['manufacturerEngineCode']
    },
    {
      'type' => raw['transmission']['transmissionType'],
      'code' => raw['transmission']['name']
    },
    raw['engine']['type'],
  )
}

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
      decoded = JSON.parse(response)
      formatted = VinParser.call(decoded)

      formatted
    end

  end

end
