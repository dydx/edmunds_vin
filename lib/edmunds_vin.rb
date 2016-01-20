require "edmunds_vin/version"
require 'httparty'

module Edmunds

  # Edmunds::Vin
  class Vin
    include HTTParty

    base_uri "api.edmunds.com"

    # Edmunds::Vin.new
    # @key is your Edmunds Developer API Key
    # @format is the type of the response we need from the Edmunds API
    # @version is the Edmunds API version we are using
    def initialize(key, format: 'json', version: 'v2')
      raise ArgumentError.new('Invalid API Key') unless !key.nil? && key.length > 10
      @key = key
      @format = format
      @version = version
    end

    private
    def find(vin)
      raise ArgumentError.new('Invalid VIN') unless vin.length == 17
      self.class.get("/api/vehicle/#{@version}/vins/#{vin}?fmt=#{@format}&api_key=#{@key}")
    end

    public
    # Edmunds::Vin#full
    # vin is the Vehicle Identification Number you are querying against
    #
    # Returns the complete response from Edmunds
    def full(vin)
      find(vin).to_json
    end

    # Edmunds::Vin#basic
    # vin is the Vehicle Identification Number you are querying against
    #
    # Returns a shortened response containing just year make and model
    #
    # NOTE this used to include more info, but the API responses
    # for some cars is incomplete. I'd like some more reliable engine info
    def basic(vin)
      response = find(vin)
      data = {
        year: response['years'][0]['year'],
        make: response['make']['name'],
        model: response['model']['name'],
      }

      data.to_json
    end

  end
end
