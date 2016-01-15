require 'spec_helper'

describe EdmundsVin do

  it 'has a version number' do
    expect(EdmundsVin::VERSION).not_to be nil
  end

  describe EdmundsVin::Decoder do

    describe '.new' do

      it "requires an API Key" do
        expect{EdmundsVin::Decoder.new}.to raise_error(ArgumentError)
        expect{EdmundsVin::Decoder.new('')}.to raise_error(ArgumentError)
      end

    end

    describe '#decode' do
 
      it 'requires a vin' do
        decoder = EdmundsVin::Decoder.new(ENV['EDMUNDS_API_KEY'])
        expect{decoder.decode()}.to raise_error(ArgumentError)
      end

      it 'requires that a vin be 17 characters long' do
        decoder = EdmundsVin::Decoder.new(ENV['EDMUNDS_API_KEY'])
        expect{decoder.decode('1234')}.to raise_error(ArgumentError)
        expect{decoder.decode('238984923849023894029834')}.to raise_error(ArgumentError)
      end

      it 'resturns a JSON document' do
        decoder = EdmundsVin::Decoder.new(ENV['EDMUNDS_API_KEY'])
        response = decoder.decode('4T1BK1EB6DU056165')
        expect(response).to include_json(
          "squishVin": "4T1BK1EBDU"
        )
      end

    end

  end
  
end
